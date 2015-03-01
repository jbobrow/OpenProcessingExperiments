
size(400,400);
background(255,255,0);
fill(223,56,34);

for(int i = 30; i < 80; i = i+5){
 for(int j = 0; j < 80; j = j+5){
 triangle(i,j,200,100,400,150);
 }
} 

textSize(32);
text("look up",200,300);
fill(102,153,51);
textSize(32);
text("it's a bird",100,200);
fill(255,255,255);
textSize(32);
text("it's a plane", 150,250);
fill(255);
textSize(32);
fill(200,255,200);
text("look out", 250,350);

for( int k = 100; k<+350; k++);{
   ellipse(k,300,350,1);
}


