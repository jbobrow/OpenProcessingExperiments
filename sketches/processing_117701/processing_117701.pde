
// Based on 3D matrix tutorials on the internet, I tried to combine basic 3D shapes_ making sense spatially_ with the way we have been populating our cells in 2D.

points[] mypoints=new points[250];

void setup(){
  
  //noStroke();
  size(500,500,P3D); // For more complex sketches, OPENGL may also be used. Does not make difference.
  
  for(int i=0;i<mypoints.length;i++){
    
    mypoints[i]=new points();
  
  }
}

void draw(){
  background(190,125,125);
  lights();
  
  pushMatrix();      //I do not want translate function to affect other components. So first I push the Matrix, then set it normal with popmatrix.

  translate(150,250,0);  // the 0 point of the matrix is set to 150,250,0. This makes rotation easier since the rotation is done around matrix 0 point.
  rotateX(radians(0));
  rotateY(radians(60));
  rotateZ(radians(0));
  
  for(int i=0;i<mypoints.length;i++){  //I called my Cell class, but they will be displayed according to my new matrix.
    mypoints[i].display();
    mypoints[i].update();

  }

 strokeWeight(0.5);
  rectMode(CENTER);    
  rect(0,0,200,200); // First Cell-transparant surface.

  popMatrix();        // End matrix shifts...
  
 
  
  translate(300,250,100);    // I will not use push or pop matrix here because I do not have any object left to draw for this sketch.
   rotateX(radians(0));
   rotateY(radians(60));
  rotateZ(radians(0));
  rect(0,0,200,200); // Second Cell-transparant surface.


}


// If we think cells as points we use to draw lines, I just used points rather than ellipses to simplify learning 3D.
// Same rules, but with the most basic principles.


class points{ // this is DNA class deciding how points will move in 3D matrix.
  
  PVector location; // I do not need to use Vectors here, but I just wanna got used to PVectors since they will be key to form shapes in future, I guess.
  PVector velocity; // The increasement vector assigned to the main location.


  float speed;

  points(){
    
  location= new PVector(0,0,-0);
  speed=0.5;  

  }

    void display(){
      
      stroke(0,0,0);
      strokeWeight(2);
      point(location.x,location.y,location.z); //This will help me when I decide to draw lines among randomly flowing cells in space.

    }

      void update(){
        
     velocity= new PVector(random(-speed,speed),random(-speed,speed),random(-speed*10,speed*10));
     location.add(velocity); 

      }

}



