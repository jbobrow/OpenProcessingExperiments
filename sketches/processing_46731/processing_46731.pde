
import java.awt.Color;

class Fish {
  World world;
  pointMass[] masses;
  float size;
  float mass;
  Network network;
  int id;
  float viewWidth;
  float viewDistance;
  int numViewSensors;
  float health;
  int[] fishRGBZ = {18,204,219,160};
  float birthTime;

  Fish(World world, float initPositionX, float initPositionY, float size, float mass) {
    
    float[] initPosition = {initPositionX, initPositionY};
    masses = new pointMass[0];
    this.world = world;
    this.size = size;
    this.mass = mass;
    this.network = new Network(TYPE,NUM_INPUT_NEURONS,NUM_HIDDEN_LAYERS,NUM_HIDDEN_PER_LAYER,NUM_OUTPUT_NEURONS);
    this.health = 100;
    birthTime = world.time;
    
    //Head
    pointMass p1 = new pointMass(world, mass, size*3/4);
    arrayCopy(initPosition, p1.position);
    arrayCopy(initPosition, p1.prevPosition);
    
    //Midsection 1
    float length1 = size*0.3754;
    pointMass p2 = new pointMass(world, mass*6/8, size);
    p2.setPosition(p1.position[0]+length1, p1.position[1]);
    p2.setPrevPosition(p1.position[0]+length1, p1.position[1]);
    
    //Midsection 2
    float length2 = size*0.7;
    pointMass p3 = new pointMass(world, mass*5/8, size*1/2);
    p3.setPosition(p2.position[0]+length2, p1.position[1]);
    p3.setPrevPosition(p2.position[0]+length2, p1.position[1]);
    
    
    //Midsection 3
    float length3 = size*0.8;
    pointMass p4 = new pointMass(world, mass*1/4, size*1/4);
    p4.setPosition(p3.position[0]+length3, p1.position[1]);
    p4.setPrevPosition(p3.position[0]+length3, p1.position[1]);
    
    //Tail
    float length4 = size*0.8;
    pointMass p5 = new pointMass(world, mass*1/5,size*1/5);
    p5.setPosition(p4.position[0]+length4, p1.position[1]);
    p5.setPrevPosition(p4.position[0]+length4, p1.position[1]);
    
    //Fin 1
    float length5 = size*1.2;
    float length6 = size*0.7;
    pointMass p6 = new pointMass(world, mass*1/4, size*1/4);
    p6.setPosition(p1.position[0]+length5, p1.position[1]+length6);
    p6.setPrevPosition(p1.position[0]+length5, p1.position[1]+length6);
    
    //Fin 2
    pointMass p7 = new pointMass(world, mass*1/4, size*1/4);
    p7.setPosition(p1.position[0]+length5, p1.position[1]-length6);
    p7.setPrevPosition(p1.position[0]+length5, p1.position[1]-length6);
    
    p1.applyRodConstraint(p2, length1);
    p1.applyDistanceConstraint(p3, length2*1.5);
    p2.applyRodConstraint(p3, length2);
    p2.applyDistanceConstraint(p4, length2*1.4);
    p3.applyRodConstraint(p4, length3);
    p3.applyDistanceConstraint(p5, length4*1.8);
    p4.applyRodConstraint(p5, length4);
    p6.applyRodConstraint(p1, length5);
    p6.applySpringConstraint(p3, sqrt(sq(p6.position[0]-p3.position[0])+sq(p6.position[1]-p3.position[1])),0.1);
    p6.applyRodConstraint(p7, sqrt(sq(p6.position[0]-p7.position[0])+sq(p6.position[1]-p7.position[1])));
    p7.applyRodConstraint(p1, length5);
    p7.applySpringConstraint(p3, sqrt(sq(p7.position[0]-p3.position[0])+sq(p7.position[1]-p3.position[1])),0.1);

    masses = (pointMass[])append(masses, p1);
    masses = (pointMass[])append(masses, p2);
    masses = (pointMass[])append(masses, p3);
    masses = (pointMass[])append(masses, p4);
    masses = (pointMass[])append(masses, p5);
    masses = (pointMass[])append(masses, p6);
    masses = (pointMass[])append(masses, p7);
    
    arrayCopy(fishRGBZ, p1.massRGBZ);
    arrayCopy(fishRGBZ, p2.massRGBZ);
    arrayCopy(fishRGBZ, p3.massRGBZ);
    arrayCopy(fishRGBZ, p4.massRGBZ);
    arrayCopy(fishRGBZ, p5.massRGBZ);
    arrayCopy(fishRGBZ, p6.massRGBZ);
    arrayCopy(fishRGBZ, p7.massRGBZ);
  }

  void setRGBZ(int R, int G, int B, int Z) {
    fishRGBZ[0] = R;
    fishRGBZ[1] = G;
    fishRGBZ[2] = B;
    fishRGBZ[3] = Z;
    for (int i = 0; i < masses.length; i++) {
      arrayCopy(fishRGBZ, masses[i].massRGBZ);
    }
  }
  
  void setPosition(float posx, float posy) {
    //Head
    pointMass p1 = masses[0];
    p1.setPosition(posx,posy);
    p1.setPrevPosition(posx,posy);
    
    //Midsection 1
    float length1 = size*0.3754;
    pointMass p2 = masses[1];
    p2.setPosition(p1.position[0]+length1, p1.position[1]);
    p2.setPrevPosition(p1.position[0]+length1, p1.position[1]);
    
    //Midsection 2
    float length2 = size*0.7;
    pointMass p3 = masses[2];
    p3.setPosition(p2.position[0]+length2, p1.position[1]);
    p3.setPrevPosition(p2.position[0]+length2, p1.position[1]);
    
    
    //Midsection 3
    float length3 = size*0.8;
    pointMass p4 = masses[3];
    p4.setPosition(p3.position[0]+length3, p1.position[1]);
    p4.setPrevPosition(p3.position[0]+length3, p1.position[1]);
    
    //Tail
    float length4 = size*0.8;
    pointMass p5 = masses[4];
    p5.setPosition(p4.position[0]+length4, p1.position[1]);
    p5.setPrevPosition(p4.position[0]+length4, p1.position[1]);
    
    //Fin 1
    float length5 = size*1.2;
    float length6 = size*0.7;
    pointMass p6 = masses[5];
    p6.setPosition(p1.position[0]+length5, p1.position[1]+length6);
    p6.setPrevPosition(p1.position[0]+length5, p1.position[1]+length6);
    
    //Fin 2
    pointMass p7 = masses[6];
    p7.setPosition(p1.position[0]+length5, p1.position[1]-length6);
    p7.setPrevPosition(p1.position[0]+length5, p1.position[1]-length6);
  }
  
  float[] getAveragePosition() {
    float[] average = new float[2];
    for (int i = 0; i<7; i++) {
      average[0] += masses[i].position[0];
      average[1] += masses[i].position[1];
    }
    average[0] /= 7;
    average[1] /= 7;
    return average;
  }
  
  float[] getAverageVelocity() {
    float[] average = new float[2];
    for (int i = 0; i<4; i++) {
      average[0] += (masses[i].position[0]-masses[i].prevPosition[0])/world.timeStep;
      average[1] += (masses[i].position[1]-masses[i].prevPosition[1])/world.timeStep;
    }
    average[0] /= 7;
    average[1] /= 7;
    return average;
  }
  
  // Back and forth "swimming" motion
  void swim() {
  //float directionX = getMass(0).position[0] - getMass(1).position[0];
  //float directionY = getMass(0).position[1] - getMass(1).position[1];
    float directionX = getAverageVelocity()[0];
    float directionY = getAverageVelocity()[1];
    float sDist = (directionX*directionX + directionY*directionY);
    directionX = (directionX*directionX)/sDist;
    directionY = (directionY*directionY)/sDist;
    //strokeWeight(1);
    //stroke(255);
    //line(getMass(1).position[0],getMass(1).position[1],getMass(1).position[0]+directionX,getMass(1).position[1]+directionY);
    float perpX = -directionY*sin(world.time*2)*3;
    float perpY = directionX*sin(world.time*2)*3;
    //line(getMass(1).position[0],getMass(1).position[1],getMass(1).position[0]+perpX,getMass(1).position[1]+perpY);
    masses[0].position[0] += min(perpX*world.timeStep,1);
    masses[0].position[1] += min(perpY*world.timeStep,1);
    
    //Forward
    //getMass(0).position[0] += directionX*world.timeStep*1;
    //getMass(0).position[1] += directionY*world.timeStep*1;
    
    masses[2].position[0] -= min(perpX*world.timeStep,1);
    masses[2].position[1] -= min(perpY*world.timeStep,1);
  }
  
  void think() {
//    network.neurons[network.neurons.length-1].output = (getMass(0).position[0] - mouseX)/512;
//    network.neurons[network.neurons.length-2].output = (getMass(0).position[1] - mouseY)/512;
    network.neurons[network.neurons.length-(numViewSensors+1)].output = masses[0].position[0]-masses[0].prevPosition[0];
    network.neurons[network.neurons.length-(numViewSensors+2)].output = masses[0].position[1]-masses[0].prevPosition[1];
    
    network.neurons[network.neurons.length-(numViewSensors+3)].output = (1-health/100)*2;

    network.neurons[network.neurons.length-(numViewSensors+4)].output = masses[0].position[0]-masses[1].position[0];
    network.neurons[network.neurons.length-(numViewSensors+5)].output = masses[0].position[1]-masses[1].position[1];
    
    network.update();
    
    masses[0].position[0] += network.neurons[0].output * world.timeStep * 1.2;
    masses[0].position[1] += network.neurons[1].output * world.timeStep * 1.2;
    if (world.displayForces) {
      stroke(127);
      strokeWeight(1);
      line(masses[0].position[0],masses[0].position[1],masses[0].position[0]+network.neurons[0].output*40,masses[0].position[1]+network.neurons[1].output*40);
    }
//    
//    float forceX = network.neurons[0].output;
//    float forceY = network.neurons[1].output;
//    
//    float forceLength = sqrt(sq(forceX) + sq(forceY));
//    float forceXunit = forceX/forceLength;
//    float forceYunit = forceY/forceLength;
//    
//    float diffX = mouseX - masses[0].position[0];
//    float diffY = mouseY - masses[0].position[1];
//    float dist = sqrt(sq(diffX) + sq(diffY));
//    float diffXunit = diffX/dist;
//    float diffYunit = diffY/dist;
//    
//    float errorX = diffXunit - forceXunit;
//    float errorY = diffYunit - forceYunit;
//    float mutRate = (sq(errorX) +sq(errorY))/4;
//    fish1.network.mutateWeightGenome(mutRate,0.1);
//    if (mutRate > 0.8) {
//      //network.remakeNetwork();
//      //println("Remade network.");
//    }
  }
  
  void see() {
    float[] headPosition = masses[0].position;
    float x1 = headPosition[0];
    float y1 = headPosition[1];
    
    float lookx = x1-masses[1].position[0];
    float looky = y1-masses[1].position[1];
    float looklength = (lookx*lookx) + (looky*looky);
    float lookunitx = lookx/looklength;
    float lookunity = looky/looklength;
    float perplookx = -lookunity;
    float perplooky = lookunitx;
    
    if (world.displayForces) {
      stroke(0,255,0,120);
      strokeWeight(1.4);
      line(x1, y1, x1+lookunitx*20, y1+lookunity*20);
      line(x1+lookunitx*20,  y1+lookunity*20,  x1+lookunitx*20+perplookx*viewWidth/2,  y1+lookunity*20+perplooky*viewWidth/2);
      line(x1+lookunitx*20,  y1+lookunity*20,  x1+lookunitx*20-perplookx*viewWidth/2,  y1+lookunity*20-perplooky*viewWidth/2);
      line(x1,  y1,  x1+lookunitx*20+perplookx*viewWidth/2,  y1+lookunity*20+perplooky*viewWidth/2);
      line(x1,  y1,  x1+lookunitx*20-perplookx*viewWidth/2,  y1+lookunity*20-perplooky*viewWidth/2);
    }
    
    for (int i = 0; i<numViewSensors; i++) {
      network.neurons[network.neurons.length-(i+1)].output = 0;
    }
    
    for (int j = 0; j<world.fishes.length; j++) {
      if (world.fishes[j] != this){
        //Object looking at
        float x2 = world.fishes[j].masses[0].position[0];
        float y2 = world.fishes[j].masses[0].position[1];
        
        float distSq = (x1 - x2)*(x1 - x2)+(y1 - y2)*(y1 - y2);
        
        float x3 = x1+lookunitx*20+perplookx*viewWidth/2;
        float y3 = y1+lookunity*20+perplooky*viewWidth/2;
        
        float x4 = x1+lookunitx*20-perplookx*viewWidth/2;
        float y4 = y1+lookunity*20-perplooky*viewWidth/2;
        
        float intx = ((y3-((y4-y3)/(x4-x3))*x3)-(y1-((y2-y1)/(x2-x1))*x1))/(((y2-y1)/(x2-x1))-((y4-y3)/(x4-x3)));
        float inty = ((y2-y1)/(x2-x1))*intx+(y1-((y2-y1)/(x2-x1))*x1);
        
        fill(0,255,0);
        float dot = lookx*(x2-x1)+looky*(y2-y1);
        if (intx < max(x3,x4) && intx > min(x3,x4) && inty < max(y3,y4) && inty > min(y3,y4) && dot > 0 && distSq < (viewDistance*viewDistance)) {
          if (world.displayForces) {
            ellipse(intx,inty,2,2);
          }
          
          float diffx = intx - x4;
          float diffy = inty - y4;
          float diffdist = sqrt((diffx*diffx) + (diffy*diffy));
          float ratio = diffdist/viewWidth;
          int activatedNeuronIndex = int(ratio*numViewSensors);
          for (int i = 0; i<numViewSensors; i++) {
            if (i == activatedNeuronIndex) {
              network.neurons[network.neurons.length-(activatedNeuronIndex+1)].output += viewDistance*40/(distSq);
            } else {
              //network.neurons[network.neurons.length-(i+1)].output = 0;
            }
          }
        }
      }
    }
  }
  
  void live() {
    health -= 0.2;
    for (int i = 0; i<world.fishes.length; i++) {
      if (this != world.fishes[i]){
        float diffx = masses[0].position[0] - world.fishes[i].masses[0].position[0];
        float diffy = masses[0].position[1] - world.fishes[i].masses[0].position[1];
        float distS = (diffx*diffx) + (diffy*diffy);
        health += min(800/distS,14);
        
        if (distS < (12*12)) {
          mateFish(this,world.fishes[i]);
        }
      }
    }
    float velx = masses[0].position[0]-masses[0].prevPosition[0];
    float vely = masses[1].position[1]-masses[1].prevPosition[1];
    health -= min(1/(((velx*velx) + (vely*vely))*70),1);
    
    if (health > 100) {
      health = 100;
    }
    Color currColor = new Color(fishRGBZ[0],fishRGBZ[1],fishRGBZ[2]);
    float[] hsbColor = currColor.RGBtoHSB(fishRGBZ[0],fishRGBZ[1],fishRGBZ[2],null);
    hsbColor[1] = health/100;
    hsbColor[2] = health/200+0.5;
    Color newRGB = new Color(currColor.HSBtoRGB(hsbColor[0],hsbColor[1],hsbColor[2]));
    fishRGBZ[0] = newRGB.getRed();
    fishRGBZ[1] = newRGB.getGreen();
    fishRGBZ[2] = newRGB.getBlue();
    setRGBZ(fishRGBZ[0],fishRGBZ[1],fishRGBZ[2],100);
    if (health <= 0){
      world.replaceFish(this);
      //world.removeFish(this);
    }
  }
}


