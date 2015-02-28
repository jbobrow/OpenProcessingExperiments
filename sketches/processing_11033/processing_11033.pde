
/* your own personal space
 Hybrid Visuals
 Animation about finding your place in the world
 */

int points = 70; //number of particles
float count; //average counter
float maxSpeed = 3; //maximum velocity
float decel = 0.97; // inertia
float privacySpace = 1.5; //room needed for ego

float x[] = new float [points]; //x position
float y[] = new float [points]; //y position

float rad[] = new float [points]; //radius

float acx[] = new float[points]; // x accelaration
float acy[] = new float[points]; // y accelaration

float strokeColR[] = new float[points]; //red element of stroke
float strokeColGB[] = new float[points]; //green and blue elements of stroke

float acxtemp = 0; //average for x accelaration increase
float acytemp = 0; //average for y accelaration increase

void setup(){
  size(924,450);
  background(0);
  smooth();
  strokeWeight(3);
  noFill();

  //initial setup
  for (int i = 0; i < points; i++){
    x[i] = random(width);
    y[i] = random(height);
    rad[i] = random(20,60);  
  }

}

void draw(){
  background(0);

  for (int i = 0; i < points; i++){
    //reset temp values
    count = 0;
    acxtemp = 0;
    acytemp = 0;

    //check for nearby particles
    for (int j = 0; j < points; j++){

      float distance=dist(x[i],y[i],x[j],y[j]);
      if(distance < rad[i]*privacySpace && j != i){

        // increase temp acceleration vector based on x and y distance
        acxtemp += 10/(x[i] - x[j]);
        acytemp += 10/(y[i] - y[j]);

        //add one for averaging
        count++;
      }

    }
    if (count != 0){

      //average out the temp accelaration
      acxtemp /=count;
      acytemp /=count;

      //add accelaration
      acx[i] += acxtemp;
      acy[i] += acytemp;
    }
    // calculate inertia
    acx[i] *= decel;
    acy[i] *= decel;


    //cap speed
    if (acx[i]>maxSpeed){
      acx[i] = maxSpeed;
    }
    if (acy[i]>maxSpeed){
      acy[i] = maxSpeed;
    }
    if (acx[i]<-maxSpeed){
      acx[i] = -maxSpeed;
    }
    if (acy[i]<-maxSpeed){
      acy[i] = -maxSpeed;
    }
    //update location;
    x[i] += acx[i];
    y[i] += acy[i];

    // if particles are moving fast, make them red
    strokeColR[i]= map (abs(acx[i])+abs(acy[i]), 0.0 ,maxSpeed*2, 128, 255);
    strokeColGB[i]= map (abs(acx[i])+abs(acy[i]) ,maxSpeed*2, 0, 0, 128);

    //wrap around screen
    if(x[i] > width + rad[i] / 2){
      x[i]= 0-rad[i]/2;
    }
    if(x[i]< 0 -rad[i]/2){
      x[i] = width + rad[i] / 2;
    }
    if(y[i]< 0 -rad[i]/2){
      y[i] = height + rad[i] / 2;
    }
    if(y[i]> height +rad[i]/2){
      y[i] = 0- rad[i] / 2;
    }
    
    //draw the damn thing already!
    stroke(strokeColR[i],strokeColGB[i],strokeColGB[i]); 
    ellipse(x[i], y[i], rad[i], rad[i]);

  }
}

//click to refresh
void mousePressed(){
  for (int i = 0; i < points; i++){
    x[i] = random(width);
    y[i] = random(height);
    rad[i] = random(20,60); 
    acx[i]=0;
    acy[i]=0;
  }
}


