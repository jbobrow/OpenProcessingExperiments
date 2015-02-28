
//create a boolean to turn recording on/off
boolean record;

void setup () {
size (480, 720);
background (90,30,50);
}

void draw (){
  rectMode(CENTER);
  noStroke();
  fill (70,30,50);
  rect (width/2,height/2+25, width,500);
//rect as outlines
noFill();
stroke(120,20,30);
strokeWeight(5);


//Top
for(int j=5; j<=width; j+=7){  
stroke(70,10,60); 
strokeWeight(1.2);
line (j,0,j,720);

line (j,height-5,j,height-35);


}
for(int k=5; k<=height; k+=7){  
stroke(70,10,60); 
strokeWeight(1.2);
line (0,k,480,k);

line (width-5,k,width-35,k);
}

noStroke();
rectMode(CENTER);
for(int m=320; m<=600; m+=60){
line(width/2,m,500,30);

//lines punteadas in the top
noStroke();
fill (34,188,190);
for(int h=3; h<=height; h+=12){
rect(h,202,5,5);
rect(h,210,5,5);
rect(h,194,5,5);

//azulez abajo
rect(h,258,5,5);
rect(h,266,5,5);
rect(h,250,5,5);

//rect large orang
fill (160,140,100);
rect(h,230,5,5);
rect(h,645,6,20);
rect(h,226,6,20);

rect(h,690,3,40);
rect(h,28,3,40);
rect(h,70,6,20);

//lines punteadas in the bottom
fill (34,188,190);
for(int o=7; o<=height; o+=32){
rect(o,276,15,2);
}

fill (34,188,190);
for(int o=7; o<=height; o+=32){
rect(o,242,15,2);
rect(o,300,15,2);
rect(o,90,15,2);
rect(o,100,15,2);
rect(o,110,15,2);
rect(o,590,15,2);
}

noStroke();
rectMode(CENTER);
for(int s=320; s<=600; s+=60){
rect(width/2,s,500,30);


}
//triangles
for(int t=5; t<=width; t+=40){  
triangle (t, height-100, t, height -120, t+30, height-100);  
}

for(int y=5; y<=width; y+=40){  
triangle (y, height-536, y+10, height -600, y+25, height-536);  
}
}

}
}


