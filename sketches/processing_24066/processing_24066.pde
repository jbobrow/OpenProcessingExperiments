
  
  ArrayList tri = new ArrayList();
  
  void setup(){
    size(500,500);
    background(0);
  }
   
   
  void draw(){
    
    //test.draw2();
    
    for(int i = 0; i < tri.size() -1; i++){
      tri.add (new Triangle());
      Triangle test = (Triangle) tri.get(i);
      test.display();
      println(test.getx1());
      println("Working?");
    }      
  }
   
  
   
  class Triangle{
    
    //coordinates of the triangle
    int x1, x2, x3, y1, y2, y3;
    
    float age; //how long ago it was first drawn
    color triangleColor; //color of the triangle
    int triangleAlpha;   //Alpha level of the triangle - 0 to 255
    
   
    //constructor
    Triangle(){
      this.x1 = (int) random(-10, width +10);
      this.x2 = (int) random(-10, width +10);
      this.x3 = (int) random(-10, width +10);
      this.y1 = (int) random(-10, height +10);
      this.y2 = (int) random(-10, height +10);
      this.y3 = (int) random(-10, height +10);
      this.age = 0;
          
      this.triangleAlpha = (int) random(0, 255);
      
    }
    
    void updateAge(){
      this.age = this.age + 0.1;
    }
    
    int getx1 (){
      return this.x1;
    }
   
    void display(){
      fill(255);
      triangle(this.x1, this.y1, this.x2, this.y2, this.x3, this.y3);
      //filter(BLUR, this.age);
    }
  }

