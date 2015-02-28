
//Terrance Shields - Prof. Calli Higgins - HW 2.1 - 2/5/13

//fix the 15 errors

void setup() { // 1.() needed to be after setup and 2.removed the space between set and up
 size(200,200); // 3.changed period to a coma 4.needed semi colon
}

void draw() { //5.added void 6.changed drawing to Draw and 7.changed [ to {
  background(0); //8.added semi colon after )
fill(255,255,255); //9.added missing B info 255
ellipse(100,100,100,100); //10.changed Ellipse to ellipse 11.added second Y value to 100
line(100,100,150,150); //12. changed x and y values
rect(mouseX,mouseY,50,50); //13.changed to mouseX 14.changed to mouseY 15.added semi colon
}


