
int x,y;







void setup(){

  size(500,500);

  background(31,47,84);

  noStroke();

  smooth();

  fill(0);




}




void draw(){

  

}




void mousePressed(){

  ellipse(mouseX,mouseY,20,20);

}




void keyPressed(){

  

  switch(key){

    

    //default black

    

    case'q': //color is yellow

    fill(255,255,0);

    break;

    

    case'w': //tone down

    fill(255,253,82);

    break;

    

    case'e': //more tone down

    fill(255,254,152);

    break;

    

    case'r': //size up

    ellipse(mouseX,mouseY,30,30);

    break;

    

    case't': //size down

    ellipse(mouseX,mouseY,10,10);

    break;

    

    case'a': //color white

    fill(255);

    break;

    

    case's': // color lightred

    fill(255,152,161);

    break;

    

    case'd': //deletedd

    background(31,47,84);

    break;

    

    case'f': //color lightblue

    fill(224,255,251);

    break;

    

    

  }

}

    


