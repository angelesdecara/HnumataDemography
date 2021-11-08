 !
 !  program to get summaries and generates times and n's
! remember to change Summary Statistic to Summary_Statistic
! with branching numata - numata from brazil
program SummToYN
  implicit none
  integer::i,j,k,l
  integer,parameter:: dp=KIND(1.d0) ! generation time
  integer,parameter:: nvars=16 ! 37 for abc ! 13 for NoMig
  character(len=10)::namevars(nvars),achar,aname
  real(dp)::means(nvars),mu,time0,g
  character(len=12)::outname
  character(len=10)::realchar
  mu=1.9d-9
  g=.25d0
!
  ! thetas and taus multiplied by 100, divide! done by R
     open(11,file='TausThetasV3.csv') ! pairwise migrations
!
  do i=1,nvars
     read(11,*)namevars(i),means(i)
  enddo
!
! let's try plotting this
  outname='wabc'
  time0=0.005 ! for wabc
!  time0=-.003
  write(6,*)(means(i),i=9,13)
  open(22,file='InYearsToPlot'//trim(outname))
  write(22,*)0,means(16)*1.05,'CPEIN' !! founder pop
  write(22,*)0,means(16),namevars(16),means(11) !! c-pein
  write(22,*)
  write(22,*)0,means(16),namevars(16)!,means(9) !! c-pein
  write(22,*)5,means(15),namevars(15),means(10) !! pe-in
  write(22,*)10,means(14),namevars(14),means(9) !! in
  write(22,*)15,means(13),namevars(13),means(8) !! numata A - numata B
  write(22,*)20,time0,'NumataA',means(2) !! Numata
  write(22,*)
  write(22,*)15,means(13),namevars(13)!,means(7) !! numata A - numata B
  write(22,*)16,time0,'NumataB',means(3) !! Numata
  write(22,*)
  write(22,*)10,means(14),namevars(14)!,means(7) !! in
  write(22,*)10,time0,'Ismenius',means(6)
  write(22,*)
  write(22,*)5,means(15),namevars(15)!,means(8) !! pe-in
  write(22,*)3,means(12),namevars(12),means(7) !! pe
  write(22,*)5,time0,'Elevatus',means(5) !! e
  write(22,*)
  write(22,*)3,means(12),namevars(12)!,means(6) !! pe
  write(22,*)1,time0,'Pardalinus',means(4) !! p
  write(22,*)
  write(22,*)0,means(16),namevars(16)!,means(9) !!c-pein
  write(22,*)-10,time0,'Cydno',means(1)

  open(33,file='InYearsscriptToPlot'//trim(outname))
  write(33,*)'set arrow from ',0,',',means(16)*1.05,' to ',0,',',means(16),' lw ',100*means(11),' nohead' !! till c-pein
  write(33,*)'set arrow from ',0,',',means(16),' to ',-10,',',time0,' lw ',means(1)*100,' nohead' !! Cydno
  write(33,*)'set arrow from ',0,',',means(16),' to ',5,',',means(15),' lw ',means(10)*100,' nohead' !! till cpein to pein 
  write(33,*)'set arrow from ',5,',',means(15),' to ',10,',',means(14),' lw ',means(9)*100,' nohead' !! in !!  pein to in
  write(33,*)'set arrow from ',5,',',means(15),' to ',3,',',means(12),' lw ',means(7)*100,' nohead' !!   pein to pe
!
  write(33,*)'set arrow from ',10,',',means(14),' to ',15,',',means(13),' lw ',means(8)*100,' nohead' !!  in to N
  write(33,*)'set arrow from ',15,',',means(13),' to ',20,',',time0,' lw ',means(2)*100,' nohead' !!  N to Na
  write(33,*)'set arrow from ',15,',',means(13),' to ',16,',',time0,' lw ',means(3)*100,' nohead' !!  N to Nb
  write(33,*)'set arrow from ',10,',',means(14),' to ',10,',',time0,' lw ',means(6)*100,' nohead' !!  in to I
!
  write(33,*)'set arrow from ',3,',',means(12),' to ',1,',',time0,' lw ',means(4)*100,' nohead' !! pe to P
  write(33,*)'set arrow from ',3,',',means(12),' to ',5,',',time0,' lw ',means(5)*100,' nohead' !! pe to E
!  write(33,*)' unset xtics'
  write(33,*)' set format x '''''
  write(33,*)' set xtics scale 0'
  write(33,*)' set style textbox opaque'
!
   write(33,*)'set ytics nomirror'
   !   write(33,*)'set border 2' ! only xaxis
   write(33,*)'set border 10' ! both yaxis and y2axis
   !
   ! test y2tics at divergence in years
   !
   write(33,*)'set ylabel "Time (coalescent units)"'
   write(33,*)'set y2label "Time (years)"'

   write(6,*)(means(16)*g/mu),realchar((means(16)*g/mu))
   !!beware, these times are per generation
   write(33,*)'set y2tics ("',trim(realchar(means(16)*g/mu)),'"',means(16),',',& !cpein
        '"',trim(realchar(means(15)*g/mu)),'"',means(15),',',& ! pein
        '"',trim(realchar(means(14)*g/mu)),'"',means(14),',',& ! in
        '"',trim(realchar(means(13)*g/mu)),'"',means(13),& ! pe
        ',','"',&
        trim(realchar(means(12)*g/mu)),'"',means(12),')' !n
   !
  write(33,*)'p ', '"'//'InYearsToPlot'//trim(adjustl(outname))//'"',' u 1:2:(0.15) w circles notitle',", """"  u 1:2 w l notitle",&
       ",  ""< awk ",' ''{if ($2 < ',means(12),') print }'' ','InYearsToPlot'//trim(adjustl(outname)), ' " ', &
       " u 1:2:3 w labels offset 3.8,0 notitle",&
       ', ''''  u 1:2:(sprintf(''%.g'',$4)) w labels center boxed offset 0,1 notitle'  ,      &
       ",  ""< awk ",' ''{if ($2 >=',means(12),' && $4 > 0) print }'' ', 'InYearsToPlot'//trim(adjustl(outname)), '"',  &
       ' u 1:2:(sprintf(''%.g'',$4)) w labels center boxed  notitle'

!
!!  write(6,*)'That''s all folks' ! this works
!
!
!
! I need as output taudiv, tau_pco, t

end program SummToYN
 function realchar(realnumber)
   implicit none
   integer,parameter::dp=KIND(1.d0)
   real(dp)::realnumber
   character(len=10)::realchar
   write(realchar,'(f10.0)')realnumber
   realchar=trim(adjustl(realchar))
 end function realchar
