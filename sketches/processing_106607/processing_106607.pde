
//Objetos
//Componentes
WheelComponent wheel1;
WheelComponent wheel2;
WheelComponent wheel3;

// Color variables
  // computer
  int R;
  int G;
  int B;  
  
  // user
  int userR = 200;
  int userG = 200;
  int userB = 200;

// layout
int mainRadius = 250;

void setup(){
  size(800, 600);
  colorMode(RGB);

  //Objetos  
  //Componentes
  wheel1 = new WheelComponent("red", userR, width*4/5, height/4);
  wheel2 = new WheelComponent("green", userG, width*4/5, height*2/4);
  wheel3 = new WheelComponent("blue", userB, width*4/5, height*3/4);

  randomColor();  
}

void css(String style){
  
}

void randomColor(){
  R = round(random(0, 255));
  G = round(random(0, 255));
  B = round(random(0, 255));
  println(R);
  println(G);
  println(B);
}

void checkColor(){
  int range = 10;
  if(  (userR - range) < R && R < (userR + range)
    && (userG - range) < G && G < (userG + range)
    && (userB - range) < B && B < (userB + range)){
      fill(0);
      textAlign(CENTER);
      text("yeah", 100, 140);
    }
}

//float time;
//void mousePressed(){
//  time = millis();
//}

void draw(){  
  background(255);
  wheel1.display();
  wheel2.display();
  wheel3.display();

  // Counter
  int minutes = millis()/60000;
  int seconds = millis()/1000;

//  String time = nf(minutes, 2, 0) + ":" + nf(seconds, 2, 0) + ":" + millis();
  fill(0);
  textAlign(CENTER);
  String time = nf(minutes, 2, -1) + ":" + nf(seconds, 2, -1);
  text(time, 100, 100);
  
  // Computer
  noStroke();
  fill(R, G, B);
  ellipse(width*2/6, height/2, mainRadius, mainRadius);  
  
  // User
  noStroke();
  fill(userR, userG, userB);
  ellipse(width*3/6, height/2, mainRadius, mainRadius);
  
  checkColor();
}
class WheelComponent{
  //Data vars
  String name;
  float angle1;
  float angle2;
  int value;
  int increment;
  Boolean isChanging;

  //Layout vars
  float radius;
  float weight;
  int posX;
  int posY;
  int wheelColor;
  
  WheelComponent(String tempName, int tempVar, int tempX, int tempY){
    //Data vars
    name = tempName;
    value = tempVar;

    //Layout vars
    radius = 60;
    weight = 30;
    posX = tempX;
    posY = tempY;
    isChanging = false;
  }

  void incrementa(){
    value += increment;
    value = constrain(value, 0, 255);
    
    if(name == "red"){
      userR = value;
    }else if(name == "green"){
      userG = value;
    }else{
      userB = value;      
    }    
  }  
  
  void display(){
    
    if(dist(posX, posY, mouseX, mouseY) <= (radius + weight/2)){
      isChanging = true;
    }else{
      isChanging = false;
    }
    
    //Verificando o sentido do giro
    if(isChanging){
      if(angle2 > angle1){        //Horário
        increment = 2;
        incrementa();
      }else if(angle2 < angle1){  //Anti-horário
          increment = -2;
          incrementa();
      }
    }
    //Atribuindo o novo ângulo
    angle1 = angle2;
    
    //Desenhando
    pushMatrix();
      translate(posX, posY);

      angle2 = atan2(mouseY - posY, mouseX - posX);

      if(name == "red"){
        wheelColor = color(value, 0, 0);
      }else if(name == "green"){
        wheelColor = color(0, value, 0);
      }else{
        wheelColor = color(0, 0, value);      
      }
      
      //Texto
//      fill(255);
//      estilo("textoWheel");
//      textAlign(CENTER);
//      text(nf(value, 0, 2), 0, 0);
      
      //Aro
      noFill();
      stroke(wheelColor);
      strokeWeight(weight);
      ellipse(0, 0, 2*radius, 2*radius);

      if(isChanging){
        //Bolinha
        rotate(angle2);
        //noFill(255);
        stroke(255);
        strokeWeight(2);
        ellipse(radius, 0 , 30, 30);
      }
    
    popMatrix();
  }
}


