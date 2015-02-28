
size(700,700);
background(0);

strokeWeight(1);
stroke(255);
line(width * 0.5, 0, width * 0.5, height);
line(0, height * 0.5, width, height * 0.5);
//line(width * 0.25, 0, width * 0.25, height * 0.5);
//line(0, height * 0.25, width * 0.5, height * 0.25);
line(width * 0.75, height * 0.5, width * 0.75, height);
line(width * 0.5, height * 0.75, width, height * 0.75);

noFill();
stroke(255,50,200);
for(int a= 0; a <= (width * 0.5); a += 20) {
  for(int c= 0; c <= (width * .5); c += 20) {
    if((a <= (width * 0.75)) && (c <= (width * 0.75))) {
      
 rectMode(CENTER);
 strokeWeight((a/c)*0.04);
//stroke(255,50,200); 
//rect(width * 0.75, height * 0.75, a, c);

stroke(30, 180, 255);
rect(width * 0.25, height * 0.75, c, a);

//strokeWeight(1);
//stroke(100,255,30);
//ellipse(width * 0.75, height * 0.75, a, c);

strokeWeight((a/c)*0.1);
stroke(255, 100,70);
bezier(width * 0.5, c, a / 3, c / 3, a * 0.25, c * 0.25, a, height * 0.5);

    }
  }
}


stroke(100,255,30);
for(float b= 0; b <= (width * 0.5); b += 15) {
  strokeWeight(b/200);
ellipse(width * 0.75, height * 0.75, b, height * 0.5);
ellipse(width * 0.75, height * 0.75, width * 0.5, b);

}

for(float d= width; d >= (width * 0.5); d -= 12) {
  for(float f= (height*0.5); f >= (height * 0.5); f -= 6) {
    
  strokeWeight((d-f)*0.01);
    stroke(255,100,255);
  bezier(d, f, width*0.75 -(d/2), (f*0.2), (width*0.5) + (d*0.5), f*.5, d, 0);
  //stroke(190,230,130);
  bezier(d, 0, width -(d*.01), (f*0.6), (width*0.5) + (d*0.5), f*.5, d, height * 0.5);
  }
}
  




