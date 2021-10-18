  !
  ! to read MeanFst.dat and average
! there's a scaffold very short and giving 0s or Fst Nan
program readaverFst
  implicit none
  integer::i,j,k,l,idummy,io,ndatos
  integer,parameter::dp=KIND(1.d0)
  real(dp)::meanfst(2000,55)
  character(len=50)::avar(55)
  character(len=30)::aname,arg,inname
  call get_command_argument(1,arg)
  inname=trim(adjustl(arg))
  !  open(23,file='MeanFst.dat',status='old')
    open(23,file=trim(adjustl(inname)),status='old')
  read(23,*)aname,avar(:)
  io=0; ndatos=0
  do while(io.eq.0)
     ndatos=ndatos+1
     read(23,*,IOSTAT=io)aname,meanfst(ndatos,1:55)
  enddo
  ndatos=ndatos-1
  write(6,*)ndatos,meanfst(155,10),sum(meanfst(1:ndatos,10)),ndatos

  open(24,file='GenomeFst')
  write(24,'(55a29)')avar(1:55)
  write(24,'(55f10.5)')(sum(meanfst(1:ndatos,j)/ndatos),j=1,55)

end program readaverFst
