
// MORE PATTERNS!

size(800,600);
background(255);

for (int a = 10; a < 400; a += 35) {
 for (int b = 10; b < 400; b += 25) {
   fill(255,2);
   ellipse(width*0.5,height*0.5,a,b);
   ellipse(width*0.5,height*0.5,b,a);
 }
}


