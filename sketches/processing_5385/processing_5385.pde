

//array of neurons 
//each neuron has 3 dendrites (photoresistors)
//each neuron also has an Axon (LED)

class Neuron{
  
  //the x and y positions of the neuron
  float xpos;
  float ypos;
  //this is the axis dividing the dendrites from the axon
  float mid;
  
  
  float d1; //angle for the first dendrite
  float den1; //slope for the first dendrite
  float[] synapse1; //array of synapses
  int syn1c;
  float d2; //angle for the second dendrite
  float den2; //slope for the second dendrite
  float[] synapse2;
  int syn2c;
  float d3; //angle for the third dendrite
  float den3; //slope for the third dendrite
  float[] synapse3;
  int syn3c;
    
    //X and Y locations for the dendrites 
  float d1x;
  float d1y;
  float d2x;
  float d2y;
  float d3x;
  float d3y;
  
  float axon; //angle for the axon
  float as; //slope of the axon
  //location of the axion
  float ax;
  float ay;
  boolean state_c;
  boolean state_n;

Neuron()
{
    float tempx=random(width);
  float tempy =random(height);

  while(!(tempy<height/3||tempy>2*height/3)&&!(tempx<width/3||tempx>2*width/3))
  {
    tempx=random(width);
    tempy=random(height);
  }
  //first we get the positions
  xpos = tempx;
  ypos = tempy;
  
    float rotation_slope = (ypos-(height/2))/(xpos-(width/2));
  float rotation_angle = atan(rotation_slope);
  if(xpos<(width/2)){rotation_angle= (rotation_angle+(PI));}
  //print("rotation_slope: "+rotation_slope+"\n");
  //print("rotation_angle: "+rotation_angle+"\n");
  
  
  //then the orientation
  mid = radians(random(-20,40))+rotation_angle;
  //angles of the dendrites
  d1 = mid+radians(random(180));
  d2 = mid+radians(random(180));
  d3 = mid+radians(random(180));
  
  //here we set up the arrays to hold the synaptic connections
  synapse1 = new float[num];
  syn1c = 0;
  synapse2 = new float[num];
  syn2c = 0;
  synapse3 = new float[num];
  syn3c = 0;
  
  //here we correct the angles over 2PI.
  if(d1 > (2*PI)) d1 = d1 - 2*PI;
  if(d2 > (2*PI)) d2 = d2 - 2*PI;
  if(d3 > (2*PI)) d3 = d3 - 2*PI;
    
    
  //here we correct the negative angles (positive ones are easier to work with.
  if(d1 < 0) d1 = d1 + 2*PI;
  if(d2 < 0) d2 = d2 + 2*PI;
  if(d3 < 0) d3 = d3 + 2*PI;
  
  //print("d1-"+d1+" ");
  
    //for our purposes the dendrites will always be 25 from the neuron center
  d1x = xpos + 25 * cos(d1);
  d1y = ypos + 25 * sin(d1);
  d2x = xpos + 25 * cos(d2);
  d2y = ypos + 25 * sin(d2);
  d3x = xpos + 25 * cos(d3);
  d3y = ypos + 25 * sin(d3);
  
    
  den1 = tan(d1);
  den2 = tan(d2);
  den3 = tan(d3);
  
  
  //our axon will be 50-75 from the center
  axon = mid-(PI/2);
  if(axon < 0) axon = axon + 2*PI;
  ax = xpos + random(50,75) * cos(axon);
  ay = ypos + random(50,75) * sin(axon);
  as = tan(axon);  
  //here we set a random initial state for the neuron
  if(random(-1,1) < 0){state_c=true;}
  else{state_c=false;}
}
  void circles()
  {
    stroke(0);
    fill(0);
    ellipse(xpos,ypos,10,10);
    fill(255,0,0);
    line(xpos,ypos,d1x,d1y);
    ellipse(d1x,d1y,5,5);
    
    line(xpos,ypos,d2x,d2y);
    ellipse(d2x,d2y,5,5);
    line(xpos,ypos,d3x,d3y);
    ellipse(d3x,d3y,5,5);
    
    if(state_c){fill(255);}
    else{fill(0,100,0);}
    line(xpos,ypos,ax,ay);
    ellipse(ax,ay,15,15);
   }
   
   
    void connect(float id, float bank)
    {
      if(bank==1)
      {
        synapse1[syn1c] = id;
        syn1c++;
      }
      if(bank==2)
      {
        synapse2[syn2c] = id;
        syn2c++;
      }
      if(bank==3)
      {
        synapse3[syn3c] = id;
        syn3c++;
      }
    }
//here we check the input to the dendrites
void increment(Neuron[] Brain)
{
  float intensity_total=0;
  //first synapse1
  for(int i=0; i<syn1c; i++)
  {
    if(Brain[int(synapse1[i])].active())
    {
    intensity_total += 1/(sq(dist(Brain[int(synapse1[i])].ax(),Brain[int(synapse1[i])].ay(),d1x,d1y)));
    }
  }
    //then synapse2
  for(int j=0; j<syn2c; j++)
  {
    if(Brain[int(synapse2[j])].active())
    {
    intensity_total += 1/(sq(dist(Brain[int(synapse2[j])].ax(),Brain[int(synapse2[j])].ay(),d2x,d2y)));
    }
  }
      //finally synapse3
  for(int k=0; k<syn3c; k++)
  {
    if(Brain[int(synapse3[k])].active())
    {
    intensity_total += 1/(sq(dist(Brain[int(synapse3[k])].ax(),Brain[int(synapse3[k])].ay(),d2x,d2y)));
    }
  }
  //print(""+intensity_total+" \n");
  
  //intensity threshold******************************************************************************
  if(intensity_total>1.0E-4 )
  {state_n=true;}
  else {state_n=false;}
}
    
void step()
{
  if(state_c) {state_c=false;}
  else { state_c = state_n;}
}
  
  void light(float xvar, float yvar)
  {
    if(dist(xvar,yvar,d1x,d1y)<200)
    {
      state_n=true;
      state_c=true;
    }
        if(dist(xvar,yvar,d2x,d2y)<200)
    {
      state_n=true;
      state_c=true;
    }
        if(dist(xvar,yvar,d3x,d3y)<200)
    {
      state_n=true;
      state_c=true;
    }
  }
  
  

// accessor finctions ++++++++++++++++++++++++
  //return the x and y positions of the neuron
  float xpos()
  {
  return xpos;
  }
  float ypos()
  {
  return ypos;
  }
  //this is the axis dividing the dendrites from the axon
  float mid()
  {
  return mid;
  }
  
  float den1() //return the slope fo the first dendrite
  { 
  return den1;
  }
  float den2() //return the slope fo the second dendrite
  {
  return den2;
  } 
  float den3() //return the slope fo the third dendrite
  {
  return den3;
  }
  
    float d1() //return the angle fo the first dendrite
  { 
  return d1;
  }
  float d2() //return the angle fo the second dendrite
  {
  return d2;
  } 
  float d3() //return the angle fo the third dendrite
  {
  return d3;
  }

  
    //return X or Y locations for the dendrites 
  float d1x()
  {
  return d1x;
  }
  
  float d1y()
  {
  return d1y;
  }
  
  float d2x()
  {
  return d2x;
  }
  
  float d2y()
  {
  return d2y;
  }
  
  float d3x()
  {
  return d3x;
  }
  
  float d3y()
  {
  return d3y;
  }
  
  float axon()  //angle for the axion
  {
  return axon;
  }
  
  //location of the axion
  float ax()
  {
  return ax;
  }
  
  float ay()
  {
  return ay;
  }
    float as()
  {
  return as;
  }
  //returns the state of the neuron
  boolean active()
  {
    return state_c;
  }
}

