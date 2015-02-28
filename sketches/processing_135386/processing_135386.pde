
// Control 1: Decisions
// Exercises

int a = 10;
int b = 4;
int c = 100;
int d = 33;

println(a > b);
println(a < b);
println(c > d);
println(c < d);

println(b >= c);
println(b <=c);
println(a >= d);
println(a <= d);

println(a == b);
println(a == c);
println(a == d);

println(a != b);
println(a != c);
println(a != d);

size(500,500);
background(0);

stroke(255,0,255);
strokeWeight(1);
smooth();
noFill();

if (a < 100) {
  ellipse(a,b,c,d);
  ellipse(b,a,c,d);
  ellipse(b,c,a,d);
  ellipse(b,c,d,a);
  ellipse(width*0.5,height*0.5,a,b);
  ellipse(width*0.5,height*0.5,b,a);
  ellipse(width*0.75,height*0.5,a,b);
  ellipse(width*0.75,height*0.5,b,a);
  a *= 2;
  b *= 2;
  ellipse(a,b,c,d);
  ellipse(b,a,c,d);
  ellipse(b,c,a,d);
  ellipse(b,c,d,a);
  ellipse(width*0.5,height*0.5,a,b);
  ellipse(width*0.5,height*0.5,b,a);
  ellipse(width*0.75,height*0.5,a,b);
  ellipse(width*0.75,height*0.5,b,a);
  a *= 2;
  b *= 2;
  ellipse(a,b,c,d);
  ellipse(b,a,c,d);
  ellipse(b,c,a,d);
  ellipse(b,c,d,a);
  ellipse(width*0.5,height*0.5,a,b);
  ellipse(width*0.5,height*0.5,b,a);
  ellipse(width*0.75,height*0.5,a,b);
  ellipse(width*0.75,height*0.5,b,a);
  a *= 2;
  b *= 2;
  ellipse(a,b,c,d);
  ellipse(b,a,c,d);
  ellipse(b,c,a,d);
  ellipse(b,c,d,a);
  ellipse(width*0.5,height*0.5,a,b);
  ellipse(width*0.5,height*0.5,b,a);
  ellipse(width*0.75,height*0.5,a,b);
  ellipse(width*0.75,height*0.5,b,a);
  a *= 2;
  b *= 2;
  ellipse(a,b,c,d);
  ellipse(b,a,c,d);
  ellipse(b,c,a,d);
  ellipse(b,c,d,a);
  ellipse(width*0.5,height*0.5,a,b);
  ellipse(width*0.5,height*0.5,b,a);
  ellipse(width*0.75,height*0.5,a,b);
  ellipse(width*0.75,height*0.5,b,a);
} else {
  line(width,height,a,b);
  line(width,height,b,a);
  line(width,height,c,d);
  line(width,height,d,c);
  line(width,height,a,c);
  line(width,height,c,a);
  line(width,height,a,d);
  line(width,height,d,a);
  line(width,height,b,c);
  line(width,height,c,b);
  line(width,height,b,d);
  line(width,height,d,b);
}

println("a="+a);
println("b="+b);
println("c="+c);
println("d="+d);


