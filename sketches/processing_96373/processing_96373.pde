
void setup (){
size(200,200);
background (5,1,129);
}
void draw (){
  stroke (247,150,2);
strokeWeight (6);{
for (int mouseX=0; mouseX<200; mouseX=mouseX+30)
for (int mouseY=0; mouseY<200; mouseY=mouseY+10)
point (mouseX+mouseY, mouseY+mouseX);
for (int mouseZ=9; mouseZ<200; mouseZ= mouseZ+20)
point (mouseZ, 7);
}
 
}
