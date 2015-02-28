
size (250, 250);
background (#000000);
translate(15,0);
smooth ();
rotate(0.45);

  for(int a=10; a<150;a+=10){
  stroke(#FFFFFF);
  //top left
  line(125, a, 100-a, 125);
  //top right
   stroke(#00AACC);
  line(125, a, a+210, 125);
  //bottom left
  line(125, 250-a, 100-a, 125);
  //bottom right
   stroke(#FFFFFF);
  line(125, 250-a, a+210, 125);
  }

