
void setup (){
size(200,200);
background (155,224,106);
} 
void draw (){
strokeWeight (7);{
for (int mouseX=0; mouseX<200; mouseX=mouseX+30)
for (int mouseY=0; mouseY<100; mouseY=mouseY+10)
point (mouseX+mouseY, mouseY+mouseX);
}

}
