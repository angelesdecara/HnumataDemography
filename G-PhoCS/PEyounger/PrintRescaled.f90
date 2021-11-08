  !
program rescale
  implicit none
  integer :: i,j,k,l,idummy,io
  integer,parameter::dp=KIND(1.d0),nthetas=11,ntaus=5
  real(dp),parameter::mu=1.9d-9,g=0.25d0
  real(dp)::vars(4)
  character(len=20)::achar

  open(11,file='TausThetasV3.csv')
  do i=1,nthetas
     read(11,*)achar,vars(1:4)
     write(6,'(a18,X,4(g0.8,X))')achar,vars(1:4)/(4.d0*mu)
  enddo
  do i=1,ntaus
     read(11,*)achar,vars(1:4)
     write(6,'(a18,X,4(g0.8,X))')achar,vars(1:4)*g/(mu)
  enddo

end program rescale
