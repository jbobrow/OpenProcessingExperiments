
void setup(){
    size(600,600);
    background(0,75,150);
    }

void mousePressed(){
    background(0,75,150);      // Resets background to BLUE
    fill(175,175,200);
    }

void keyPressed(){
    background(150,75,75);     // Resets background to RED
    }

void draw() {
    
  
  //background(0,0,255,0);
    //rect(mouseX, (mouseY-600), mouseX+50, (mouseY-600)+50);



// legs and arms

fill(0,0,0);
stroke(0,255,0);
    line(mouseX+50,(mouseY-600)+600,mouseX+60,(mouseY-600)+600);
    line(mouseX+80,(mouseY-600)+600,mouseX+90,(mouseY-600)+600);
    line(mouseX+60,(mouseY-600)+600,mouseX+60,(mouseY-600)+580);
    line(mouseX+80,(mouseY-600)+600,mouseX+80,(mouseY-600)+580);
    line(mouseX+50,(mouseY-600)+560,mouseX+30,(mouseY-600)+560);
    line(mouseX+90,(mouseY-600)+560,mouseX+110,(mouseY-600)+560);
    line(mouseX+30,(mouseY-600)+560,mouseX+30,(mouseY-600)+540);
    line(mouseX+110,(mouseY-600)+560,mouseX+110,(mouseY-600)+540);

// lower body

fill(0,0,255);
stroke(0);
    rect(mouseX+90,(mouseY-600)+550,mouseX+50,(mouseY-600)+580);

// head

fill(0,255,0);
stroke(0);
    pushMatrix();
    translate(mouseX+70,(mouseY-600)+490);
    rotate(radians(45));
    rect(0,0,45,45);
  //   rect(40,550,100,490);
    popMatrix();
    
// eyes and mouth


fill(0);
stroke(5);
strokeWeight(1);
    point(mouseX+60,(mouseY-600)+515);
    point(mouseX+80,(mouseY-600)+515);
    line(mouseX+70,(mouseY-600)+535,mouseX+60,(mouseY-600)+530);
    line(mouseX+70,(mouseY-600)+535,mouseX+80,(mouseY-600)+530);

// horns

fill(0,255,0);
stroke(0,255,0);
    line(mouseX+90,(mouseY-600)+510,mouseX+100,(mouseY-600)+510);
    line(mouseX+50,(mouseY-600)+510,mouseX+40,(mouseY-600)+510);
    line(mouseX+40,(mouseY-600)+510,mouseX+40,(mouseY-600)+490);
    line(mouseX+100,(mouseY-600)+510,mouseX+100,(mouseY-600)+490);
    line(mouseX+40,(mouseY-600)+490,mouseX+50,(mouseY-600)+490);
    line(mouseX+100,(mouseY-600)+490,mouseX+90,(mouseY-600)+490);
    line(mouseX+90,(mouseY-600)+490,mouseX+90,(mouseY-600)+500);
    line(mouseX+50,(mouseY-600)+500,mouseX+50,(mouseY-600)+490);
    line(mouseX+60,(mouseY-600)+500,mouseX+50,(mouseY-600)+500);
    line(mouseX+90,(mouseY-600)+500,mouseX+80,(mouseY-600)+500);

// hands and stomach


fill(125,255,125);
stroke(0,255,0);
    ellipse(mouseX+60,(mouseY-600)+560,mouseX+80,(mouseY-600)+570);
    ellipse(mouseX+110,(mouseY-600)+545,mouseX+130,(mouseY-600)+535);
    ellipse(mouseX+10,(mouseY-600)+535,mouseX+30,(mouseY-600)+545);
    
    
    ellipseMode(CORNERS);
    rectMode(CORNERS);
    
    
    
    
    
/*
     stroke(128);
     int i;
     for (i=0; i<1000; i+=50)
    { 
     line(i, 0, i, 1000);
     line(0, i, 1000, i);
    }
*/
}
