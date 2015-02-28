
//screen size
size (250,250);
//screen background white
background (255);
//smooth edges
smooth();

//loop 
for(int a = 10; a<=125; a+=20){
//starting at 10, less than 125, increased by 20
//quad 1 x1 same, y moves down, x2 moves left, y2 same
  line (125,a,125-a,125);
//quad 2 x1 same, y moves down, x2 moves right, y2 same
  line (125,a,125+a,125);
//quad 3 x1 same, y moves up, x2 right, y2 same
  line (125,250-a,125+a,125);
//quad 4 x1 same, y moves up, x2 moves left, y2 same
  line (125,250-a,125-a,125);
  
}

                                
