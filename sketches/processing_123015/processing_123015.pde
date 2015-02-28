
int monsterY;

void setup(){
size(300,300);
monsterY = 100;
}

void draw(){
background(255,255,255);
stroke(0);
ellipseMode(CENTER); 
fill(250,100,250);
ellipse(mouseX,mouseY,100,100);  //hoofd
fill(0);
rect(mouseX-20,mouseY+30,38,76);   //mond
fill(250,0,0);
ellipse(mouseX-1,mouseY+96,30,20); //tong
line(mouseX-4,mouseY+96,mouseX+14,mouseY+83);        //tongspleet
fill(255);
rect(mouseX-20,mouseY+30,38,10);    //tanden


fill(250);                   
stroke(0);                  
ellipse(mouseX+30,mouseY-10,35,35);                  //oog
ellipse(mouseX-31,mouseY-10,35,35);                  //oog

stroke(0);
line(mouseX-41,mouseY+4,mouseX-41,mouseY+19);       //wallen
line(mouseX-37,mouseY+7,mouseX-37,mouseY+22);
line(mouseX-33,mouseY+8,mouseX-33,mouseY+16);

mouseY = mouseY - 1;


}
                         

