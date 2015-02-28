
    int grass;

void setup() {
//background
    size(600,300);
    fill(0,0,0);
    rect(0,0,599,299);
//tree
    fill(60,40,0);
    rect(150,100,50,300);
    fill(0,255,0);
    ellipse(175,100,200,150);
//pumpkin
    fill(210,70,0);
    ellipse(500,260,80,70);
    fill(100,80,0);
    rect(496,220,6,10);
    fill(0,0,0);
    ellipse(485,250,15,15);
    ellipse(515,250,15,15);
    ellipse(500,275,25,15);
//grass
    fill(0,255,0);
    triangle(0,300,20,280,40,300);
    int grass=0;
while(grass<=520){
    triangle(grass+40,300,grass+60,280,grass+80,300);
    grass=grass+40;
}//end of grass 1
    int grass=0;
while(grass<=520){
    triangle(grass+20,300,grass+40,280,grass+60,300);
    grass=grass+40;
}//end of grass 2

}
//add leaves where clicked
void mouseClicked(){
    if (mouseX<400){
        leaf(mouseX-8,mouseY-12);
}
    if ((mouseX>450)&&(mouseY>250)){
        light();       
}
}

//Draw Leaf
void leaf(int x, int y){
    fill(random(255),random(255),0);
    triangle(0+x,20+y,10+x,0+y,20+x,20+y);
    triangle(0+x,6+y,10+x,26+y,20+x,6+y);
}
//light up pumpkin
void light(){
    fill(255,255,0);
    ellipse(485,250,15,15);
    ellipse(515,250,15,15);
    ellipse(500,275,25,15);
    }
