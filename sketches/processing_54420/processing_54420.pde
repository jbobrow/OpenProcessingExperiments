
class Dot { // Create a new class/object called Dot


    PVector pos; // Create a new PVector called pos. This will control position
  PVector vel; // Create a new PVector called vel. This will control velocity = change in position
  PVector acc; // Create a new PVector call acc. This will control acceleration
  float size; // Create a float (for decimal numbers) called size


    Dot(PVector _pos, int _size) { // constructor - makes the object - the Dot object will be made of PVector _pos and an integer call _size
    pos = _pos; //PVector pos is the same as _pos Makes pos the incoming info
    size = _size; //float size is the same as _size
    vel = new PVector(random(-5, 5), random(-5, 5)); // The PVector vel is between -5,5 along the x axis and between -5 and 5 along the y axis
    acc = new PVector(); //acc is still a new PVector
  }

  void run() {//i want you to run these function titles
    move();
    avoid();
    toMouse();
    render();
    bounce();
mouseClicked();  
}

  void render() { // draws the dot at...
    ellipse(pos.x, pos.y, size, size ); //create an ellipse using the pos data for x and y and the size variable
  }

  void move() {//this function determines the way the dots move 
    vel.mult(0.94); // the dots drag resistance
    pos.add(vel); // now add the velocity variabale to the dots position
    vel.add(acc); // and then add the acceleration variable to velocity variable
    acc.mult(0); // once you've do that reset acceleration to back to 0
  }

  void toMouse() { // this pulls the dots towards the mouse
    PVector m = new PVector(mouseX, mouseY); //Create a new PVector called m which will store information around the mouse x and y corrdinates
    PVector diff = PVector.sub(m, pos); //Create a new PVector called diff which will be the value of minus PVector m and pos
    // this gets the difference between the dot position
    diff.mult(0.003); // scale down
    acc.add(diff); // add the diff value to the acc value. This adds push to the acceleration
  }

  void avoid() { // avoid your neighbours
    for (int i=0; i<dots.size(); i++) { // For loop for interations
      //make i equal 0, if i is less than the 'size' value in the ArrayList (dots.size) continue and update by plus 1
      Dot N = (Dot) dots.get(i); //Create a new value called N to the Class (Dot) and add this value to i // get my neighbour
      float distance = pos.dist(N.pos); //create a new float called distance. This has the value of the distance between PVector pos and PVector N 
      if (distance < 20) { //So if this distance is less than 40
        PVector diff = PVector.sub(pos, N.pos); // then diff will be the value of pos minus N.pos // get the push
        diff.mult(0.01 * (40 - distance) / 40.0); //this value will be worked out by mulitiplying diff by 0.01 * (40 (the less than number)minus the current distance divided by 40)   
        acc.add(diff); //now add this value to the accelleration value
      }
    }
  }

  void bounce() {
    //left edge
    if (pos.x < 0) vel.x = vel.x * -1; // if your x position is less than 0 do some maths and flip your x velocity
    //top
    if (pos.y <0) vel.y = vel.y * -1; // if your y position is less than 0 do some maths and flip your y velocity
    //right
    if (pos.x >width) vel.x = vel.x * -1; // or if your x position is greater than the width of the canvas do some maths and flip your x velocity
    //bottom
    if (pos.y >height) vel.y = vel.x * -1; // if your y position is greater than the height of the canvas do some maths and flip your y velocity
  }
}


