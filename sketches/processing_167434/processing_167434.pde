
void 
setup()
{
  size(400,400);
  strokeWeight(5);
  background(255);
}

void 
draw()
{
if(mousePressed) 
  {
  line(pmouseX,pmouseY,mouseX,mouseY);}
    if(keyPressed){
    if(key=='a'){
      stroke(#456dc6);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
    if(key=='s'){
      stroke(#c60a4d);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
    else if(key=='d'){
      stroke(#c60acd);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
    else if(key=='f'){
      stroke(#55169B);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
    else if(key=='g'){
      stroke(#03FFDF);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
    else if(key=='h'){
      stroke(#E7F00C);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
    else if(key=='j'){
      stroke(#0326FF);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
    else if(key=='k'){
      stroke(#0CF043);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
    else if(key=='l'){
      stroke(#F06F0C);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
    else if(key=='ñ'){
      stroke(#BB88C9);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
     else if(key==' '){
      stroke(255);
      strokeWeight(10);
       line(pmouseX,pmouseY,mouseX,mouseY);
    }
  }
 }
