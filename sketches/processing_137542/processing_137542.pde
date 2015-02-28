
size (500, 500);
background(255);


//for(int a= 0; a<= (height); a+= 10) { 
  //for(int b= 0; b<= (width); b+= 10) {
   //stroke(a, b, a+b);
   //strokeWeight(10);
  //line(a, b, a + 10, b + 10);
  //}
//}

for(int a= 0; a<= (height); a+= 10) { 
  for(int b= 0; b<= (width); b+= 10) {
   stroke(255 - a, 0 + b, 0.4 * a + b * 0.2);
   strokeWeight(8);
   smooth();
  line(a, b, a + 10, b + 10);
  }
}
//bezier(60, 20, 30, 80, 30, 100, 30, 140);  


