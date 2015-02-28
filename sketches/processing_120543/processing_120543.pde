
int eSize = 10;
size(400,565);
background(255);
smooth();

for(int x=0; x<=width; x+=40){
    if(x == width/2){
      fill(0);
    }
    else{
      fill(0);
    }
    ellipse(x,140,eSize,eSize);
    println("x=" + x);
} //kuroten

for(int x = 0; x <= width; x ++){
   stroke(x,0,0,40);
   line(0,x,400-x,0);
   //guradeaka
   
   stroke(x/2);
   line(420,x,500-x,565);
   //guradekuro
}
 
stroke(0);
strokeWeight(10);
noFill();
ellipse(30,61,130,130);
//kuroenn

noStroke();
fill(109);
ellipse(297,175,175,175);
//haiiroenn


strokeWeight(15);
stroke(190);
line(227,0,401,295);
//haiirosenn

noStroke();
fill(255);
ellipse(298,173,83,83);
//siroenn

noStroke();
fill(0);
ellipse(299,172,35,35);
//kuroennsyou

stroke(0);
strokeWeight(10);
noFill();
triangle(170,198,20,312,194,385);
//kurosannkakukage

stroke(255,0,0);
strokeWeight(10);
noFill();
triangle(166,194,16,308,190,381);
//akasannkaku

stroke(150);
noFill();
triangle(179,355,165,450,254,414);
//haiirosannkaku

stroke(0);
noFill();
triangle(55,380,96,501,182,407);
//kiirosannkakukage

stroke(250,255,0);
noFill();
triangle(59,384,100,507,186,411);
//kiirosannkaku

stroke(0);
noFill();
triangle(220,397,234,534,346,453);
//sirosannkakukage

stroke(255);
noFill();
triangle(216,393,230,530,342,449);
//sirosannkaku


