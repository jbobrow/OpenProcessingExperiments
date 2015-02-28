

class Dot{

  PVector position;

  boolean calling; // am I calling?
  int neighbour_call_count = 0; // variable to count how many nearby creatures are caling
  
  int call_pitch_num = int(random(occur.length)); // here the variable pitch is a random frequency from the array
  int call_pitch = occur[call_pitch_num];
  int call_interval = int(random(90,100)); // the time a creature has to wait before calling again varies between 40 and 50 frames
  int interval_counter = 0; // the interval counter starts at 0
  float call_duration = 0.01;



  float theta = random(TWO_PI); // angle theta

  Dot(PVector _position){ // a constructor - has the same name as the class; 
    //builds the new object;
    //takes input parameters
    position = _position;
    calling = true;
  }

  void run(){
    call();
    render();
  }

  void call(){
    if (interval_counter > call_duration) calling=false; 
    neighbour_count = 0;

 


    interval_counter ++; //add 1 to the interval counter

    for (int i=0; i<Dots.size(); i++){ 
      // for every dot, run the following code
      Dot otherDot = (Dot) Dots.get(i); 
      // get another dot from the array
      float distance = PVector.dist(position, otherDot.position); 
      // ID distance between
      if (distance < range_of_hearing){
        neighbour_count++;  
      }
      if (distance < range_of_hearing && otherDot.calling == true) {
        // if the distance is within range and the other dot is calling
        neighbour_call_count ++;
      }   
    }

    if (neighbour_call_count > neighbour_call_threshhold && interval_counter > call_interval) {
      calling=true; // call!


      neighbour_call_count = 0;

      dotSize = range_of_hearing;

      interval_counter = 0;
    }

    call_duration = 10/(neighbour_count+1);


  }

  void render(){
   
    if (rendermode == 0){ /// put all dots rendering in here
      // float k = noise(theta)*2; 
    float x = r*sin(theta); 
    float y = r*cos(theta); 

    //if (calling==true) offscreen.stroke(255,0,100);
    //if (calling==false) offscreen.stroke(call_pitch/5,255,150);

    //strokeWeight(1);

   //ellipse (x+width/2,y+height/2,2,2);
    int[] a = new int[50]; 
  int[] b = new int[50];
 
  //fill(0); 
 // stroke(255);
// if (q > p/2) {
//       q = p/2;             
//   }

   offscreen.stroke(255,50);
   offscreen.fill(0,50);
  //noStroke();
 // noFill();
  //fill(0,5);
 // beginShape();
  for (int i = 0; i < p; i += 1) {
      a[i] = xcentre + int(radius*(cos(radians(offset + float(i)/float(p)*360.0))));
      b[i] = ycentre + int(radius*(sin(radians(offset + float(i)/float(p)*360.0))));
     offscreen.ellipse(a[i]+x+900/30, b[i]+y+700/30, 8-(r/40),8-(r/40));
     //line(a[i]+x, b[i]+y, xcentre, ycentre);
    // vertex(a[i]+x, b[i]+y);
 }
 
  //endShape(CLOSE);


 // stroke(0);   // Color of the lines
  // now join each point to the next
//  for (int i = 0; i < p; i += 1) {
//     // strokeWeight(linethickness);
//      line(a[i]+x+width/2,b[i]+y+height/2, a[(i + q) % p], b[(i + q) % p]);     
//  }


    theta += 0.02;
    r+=inc; 

  }
    
    
    
    
    
    
     
    if (rendermode == 1){/// put all polygns rendering in here
    
      // float k = noise(theta)*2; 
    float x = r*sin(theta); 
    float y = r*cos(theta); 

    if (calling==true) offscreen.stroke(255,0,100);
    if (calling==false) offscreen.stroke(call_pitch/5,255,150);

    offscreen.strokeWeight(2);

   //ellipse (x+width/2,y+height/2,2,2);
    int[] a = new int[50]; 
  int[] b = new int[50];
 
  //fill(0); 
 // stroke(255);
// if (q > p/2) {
//       q = p/2;             
//   }

  offscreen.stroke(255,150);
  //noStroke();
 // noFill();
  offscreen.fill(0,5);
  offscreen.beginShape();
  for (int i = 0; i < p; i += 1) {
      a[i] = xcentre + int(radius*(cos(radians(offset + float(i)/float(p)*360.0))));
      b[i] = ycentre + int(radius*(sin(radians(offset + float(i)/float(p)*360.0))));
      //ellipse(a[i]+x+width/3, b[i]+y+height/3, 10-(r/30),10-(r/30));
     // line(a[i]+x, b[i]+y, xcentre, ycentre);
     offscreen.vertex(a[i]+x, b[i]+y);
 }
 
  offscreen.endShape(CLOSE);


 // stroke(0);   // Color of the lines
  // now join each point to the next
//  for (int i = 0; i < p; i += 1) {
//     // strokeWeight(linethickness);
//      line(a[i]+x+width/2,b[i]+y+height/2, a[(i + q) % p], b[(i + q) % p]);     
//  }


    theta += 0.05;
    r+=inc; 

  
    
    
    
    }
    
    
    
     if (rendermode == 2){
   // float k = noise(theta)*2; 
    float x = r*sin(theta); 
    float y = r*cos(theta); 

    if (calling==true) offscreen.stroke(255,0,100);
    if (calling==false) offscreen.stroke(call_pitch/5,255,150);

    offscreen.strokeWeight(2);

   //ellipse (x+width/2,y+height/2,2,2);
    int[] a = new int[50]; 
  int[] b = new int[50];
 
  offscreen.fill(0); 
 // stroke(255);
// if (q > p/2) {
//       q = p/2;             
//   }

  //stroke(255);
  //noFill();
  for (int i = 0; i < p; i += 1) {
      a[i] = xcentre + int(radius*(cos(radians(offset + float(i)/float(p)*360.0))));
      b[i] = ycentre + int(radius*(sin(radians(offset + float(i)/float(p)*360.0))));
      offscreen.ellipse(a[i]+x+900/30, b[i]+y+700/30, 20, 20);
 }


 // stroke(0);   // Color of the lines
  // now join each point to the next
//  for (int i = 0; i < p; i += 1) {
//     // strokeWeight(linethickness);
//      line(a[i]+x+width/2,b[i]+y+height/2, a[(i + q) % p], b[(i + q) % p]);     
//  }


    theta += 0.08;
    r+=inc; 

  }
    
    
  
}
}


