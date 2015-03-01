
size(400,400);
background(342,60,1);
 for (int i = 0; i < 40; i = i+1) {
  
  line(10*i, 0, 400, 10*i);
  line(0, 10*i, 10*i, 400);
  line (400,i*10,400-10*i,400);
  line ( 0,400-10*i,10*i,00);
  stroke(15*i+50,12*i+50,0*i+50);
}


