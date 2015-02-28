
size (400,400);
smooth ();
strokeWeight (100);
background(#1F19F5);
for (float x=0;x<=900;x+=55) {
  for (float y=0; y<=900;y+=25) { 
    if ((y+x)%15==10) {
      stroke (#ff0000);
    } else{
      strokeWeight(100);
      stroke(#1F19F5); 
      fill(#ff0000);
      triangle(x,y,x,y,x,y);
    }
    fill(#ff0000);
    rect (y,x,y,x);
    quad(y,x,y,x,y,x,y,x);
    triangle(x,y,x,y,x,y);
    ellipse(x,y,y,x);

    ellipse(y,x,x,y);
    
}


}



