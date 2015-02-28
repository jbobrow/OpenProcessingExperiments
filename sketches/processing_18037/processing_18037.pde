
size(250, 250);
smooth();
background(97, 51, 93);
noFill();


fill(97, 51, 93);
for(int j=0; j<250; j+=125){
stroke(200, 210, 200);
for(int i=125; i<250; i+=25){
bezier(j, i, j+10, 30, j+30, 20, j+50, i);
}

stroke(200, 210, 200);
for(int i=125; i<250; i+=25){
bezier(j+50, i, j+90, 30, j+30, 20, j+75, i);
}

stroke(200, 210, 200);
for(int i=125; i<250; i+=25){
bezier(j+75, i, j+120, 30, j+30, 20, j+125, i);
}}

for(int y=0; y<=height; y+=40){ 
for (int x=0; x<=width; x+=40){ 
noStroke();
fill(255,140, 130, 20); 
ellipse(x,y,80,80);}} 


