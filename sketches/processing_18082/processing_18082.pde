
size(250,250); 
background(#8FD1B6);
smooth();

//pink dots
for(int y=0; y<=height; y+=30){ 
for (int x=0; x<=width; x+=30){ 
noStroke();
fill(#FA8F86,180); 
ellipse(x,y,10,10);}}

//light orange points
for(int y=0; y<=250; y+=6){ 
for(int x=0; x<=250; x+=6){ 
strokeWeight(2);
stroke(#F7E6B6); 
point(x,y);}}

for(int h=0; h<280; h+=40)
for(int k=0; k<280; k+=40)
{noStroke();
fill(255,60);
//bigger transparent circles outlined in orange
stroke(#E8B573,145);
ellipse(k,h,45,45);
//smaller transparent circles outlined in orange
stroke(#F04983,70);
ellipse(k+20,h+20,25,25);}



