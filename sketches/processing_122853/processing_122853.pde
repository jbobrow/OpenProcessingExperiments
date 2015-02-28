
void setup(){
    size(500,500);
}

void draw() {
    background(255);

    noStroke();
    fill(0);
    ellipseMode(CENTER);
    ellipse(mouseX-35,mouseY-20,30,30);        //left ear*/
    ellipse(mouseX+35,mouseY-20,30,30);      //right ear*/
    ellipse(mouseX,mouseY+60,90,90);      //body*/

    stroke(0);
    fill(255);
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY+60,60,60);      //belly*//
    ellipse(mouseX,mouseY,75,75);       //Head*/
    
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    ellipse(mouseX+30,mouseY+90,40,40);      //right foot*/
    ellipse(mouseX-20,mouseY+90,40,40);       //left foot*/
    ellipse(mouseX-35,mouseY+45,32,32);      //left hand*/
    ellipse(mouseX+35,mouseY+45,32,32);      //right hand*/
    ellipse(mouseX+15,mouseY-5,30,28);      //black spot in face*/
    
    stroke(0);
    fill(255);
    ellipseMode(CENTER);
    ellipse(mouseX+15,mouseY-5,15,15);      //right eye*/
    ellipse(mouseX-15,mouseY-5,15,15);      //left eye*/
    ellipse(mouseX,mouseY+15,35,20);    //white nose*/
    
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY+10,15,10);    //nose*/
    ellipse(mouseX+15,mouseY-5,5,5);        //right pupil*/
    ellipse(mouseX-15,mouseY-5,5,5);        //left pupil*/
    
   
    
    noStroke();
    fill(255);
    ellipse(mouseX-35,mouseY+45,20,20);    //left white hand*/
    ellipse(mouseX+35,mouseY+45,20,20);  //right white hand*/
    ellipse(mouseX+30,mouseY+90,30,30);    //right white foot*/
    ellipse(mouseX-20,mouseY+90,30,30);    //left white foot*/
  
}
