!program to get the mean from current results
!
program Fststats
  implicit none
  integer::i,j,k,l,dummy,io,startSite,midSite,endSite,nsites
  integer,parameter::dp=KIND(1.d0),lineas=1000
  integer::ndatos(121)
  real(dp)::meanfst,varfst!,piPops(npops),dxyPops(6-71),FstPops(72-126)
  real(dp)::datos(lineas,121) ! so Fst goes from 67 to 121
  real(dp)::mean(121),var(121)
  character(len=50)::aname,scaff,arg,outname
  character(len=50)::avar(126)

!  DO i=1,command_argument_count()
!     CALL get_command_argument(i,arg)
!     write(6,*)i
!     write(6,*)arg
!     pause
  !  END DO
  CALL get_command_argument(1,arg)
  aname=trim(arg)
  CALL get_command_argument(2,arg)
  outname=trim(arg)
!  write(6,*)aname
!  pause
!  read(*,*)aname
  open(11,file=trim(adjustl(aname)))
  read(11,*)avar(:) ! header
  !write(6,*)avar(5),avar(72),avar(126)
  io=0;i=0
  ndatos=0;mean=0;var=0
  do while (io.eq.0)
     i=i+1
     read(11,*,IOSTAT=io)scaff,startSite,endSite,midSite,nSites,datos(i,:)
     if(io.ne.0)exit
     do k=67,121 ! dxy or pi are never nan
        if(.not.isnan(datos(i,k)))then
!           write(6,*)i,k,datos(i,k) !it works
!           pause
           ndatos(k)=ndatos(k)+1
           mean(k)=mean(k)+datos(i,k)
           var(k)=var(k)+datos(i,k)**2
        endif
     enddo
!     write(6,*)midSite
  enddo
  close(11)
!  ndatos=i-1

  if(ndatos(67).gt.1)then !! 
     open(22,file=trim(adjustl(outname)),status='old',access='append')
     write(22,'(a12,X,55f10.5)')trim(scaff),(mean(k)/ndatos(k),k=67,121)
     write(6,'(a12,X,55f10.5)')trim(scaff),(mean(k)/ndatos(k),k=67,121)
  endif
!  write(22,'(a12,X,55f10.5)')trim(scaff),(sum(datos(1:ndatos,j)/ndatos),j=67,121)

!  write(6,'(a12,X,55f10.5)')trim(scaff),(sum(datos(1:ndatos,j)/ndatos),j=67,121)


end program Fststats
