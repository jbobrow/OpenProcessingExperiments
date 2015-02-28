
//import processing.opengl.*; // Opengl is faster, but has longer loading time and sometimes generates errors.

mcBrainClass brain;
PFont font;
PImage img;
double[][] input;
double[] output;
double[] predicted_output;
double error;
public mcBrainNode target[];
public mcBrainNode prediction[];
public mcBrainNode[] hidden1;
public mcBrainNode[] hidden2;
public mcBrainNode[] hidden3;
public mcBrainNode[] hidden4;
public mcBrainNode[] hidden5;

int observations=400;
int inputs=3;

void setup() {
  size(800, 600, P3D); // change P3D to OPENGL to run faster en smoother
  frameRate(100);
//  hint(ENABLE_OPENGL_4X_SMOOTH);
  smooth();
  font = loadFont("ArialMT-48.vlw");
  textFont(font);

  input=new double[observations][inputs];
  output=new double[observations];
  predicted_output=new double[observations];
  target=new mcBrainNode[observations];
  prediction=new mcBrainNode[observations];
  hidden1=new mcBrainNode[observations];
  hidden2=new mcBrainNode[observations];
  hidden3=new mcBrainNode[observations];
  hidden4=new mcBrainNode[observations];
  hidden5=new mcBrainNode[observations];

  initData(observations);

  brain = new mcBrainClass();
  brain.init();
  
  img = createImage(10, 10, ARGB);
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    img.pixels[i] = color(100, 100, 100, 10); 
  }
  img.updatePixels();

}

void draw() {
  background(0);
  
  brain.setTrainingData(observations, input, output);
  error=brain.step();
  predicted_output=brain.outPred;

  fill(255);
  text("Green = target", -150.0f, -125.0f, -300.0f);
  text("Red = brain learning target", -150.0f, -75.0f, -300.0f);
  text("Blue = hidden neural nodes", -150.0f, -25.0f, -300.0f);
  text("Error="+((int)(error*10000))/10000.0f, -150.0f, 25.0f, -300.0f);

  translate(width/2.0f, height/2.0f, 400); // - mouseX*0.1f);
  rotateX(4.2f); //+mouseY/300.0f);
  //rotateZ(mouseX/500.0f);
  
  for (int i=0;i<observations;i+=1) {
      prediction[i].setPosition(input[i][0]*100,predicted_output[i]*10+50,input[i][1]*100);
      hidden1[i].setPosition(input[i][0]*100+200,brain.hiddenValPRES[i][0]*10+50,input[i][1]*100);
      hidden2[i].setPosition(input[i][0]*100+300,brain.hiddenValPRES[i][1]*10+50,input[i][1]*100);
      hidden3[i].setPosition(input[i][0]*100+400,brain.hiddenValPRES[i][2]*10+50,input[i][1]*100);
      hidden4[i].setPosition(input[i][0]*100+500,brain.hiddenValPRES[i][2]*10+50,input[i][1]*100);
      hidden5[i].setPosition(input[i][0]*100+600,brain.hiddenValPRES[i][2]*10+50,input[i][1]*100);
  }
  
  stroke(128);
  for (int i=0;i<observations-21;i+=1) {
    if ((i+1)%20!=0) {
      beginShape(QUAD);
      texture(img);
      vertex(+30.0f+(float)input[i][0]*50.0f,(float)input[i][1]*50.0f,(float)predicted_output[i]*25.0f,0.0f,0.0f);
      vertex(+30.0f+(float)input[i+1][0]*50.0f,(float)input[i+1][1]*50.0f,(float)predicted_output[i+1]*25.0f,0,1);
      vertex(+30.0f+(float)input[i+21][0]*50.0f,(float)input[i+21][1]*50.0f,(float)predicted_output[i+21]*25.0f,1,1);
      vertex(+30.0f+(float)input[i+20][0]*50.0f,(float)input[i+20][1]*50.0f,(float)predicted_output[i+20]*25.0f,1,0);
      endShape();
    }
  }

  for (int i=0;i<observations-21;i+=1) {
    if ((i+1)%20!=0) {
      beginShape(QUAD);
      texture(img);
      vertex(-30.0f+(float)input[i][0]*50.0f,(float)input[i][1]*50.0f,(float)output[i]*25.0f,0.0f,0.0f);
      vertex(-30.0f+(float)input[i+1][0]*50.0f,(float)input[i+1][1]*50.0f,(float)output[i+1]*25.0f,0,1);
      vertex(-30.0f+(float)input[i+21][0]*50.0f,(float)input[i+21][1]*50.0f,(float)output[i+21]*25.0f,1,1);
      vertex(-30.0f+(float)input[i+20][0]*50.0f,(float)input[i+20][1]*50.0f,(float)output[i+20]*25.0f,1,0);
      endShape();
    }
  }
  
  
  noStroke();
  for (int i=0;i<observations;i+=1) {
    float bzp = (float)predicted_output[i] * 25.0f;
    float bzo = (float)output[i] * 25.0f;
    float bh1 = (float)brain.hiddenValPRES[i][0]*10.0f+30.0f;
    float bh2 = (float)brain.hiddenValPRES[i][1]*10.0f+30.0f;
    float bh3 = (float)brain.hiddenValPRES[i][2]*10.0f+30.0f;
    float bh4 = (float)brain.hiddenValPRES[i][3]*10.0f+30.0f;
    float bh5 = (float)brain.hiddenValPRES[i][4]*10.0f+30.0f;

    bzo=bzo/1.0f;

    pushMatrix();
    translate(-30+(float)input[i][0]*50.0f,(float)input[i][1]*50.0f,0.0f);
    translate(0.0f,0.0f,bzo);
    fill(0, 255, 0, 150);
    box(0.5f,0.5f,0.5f);
    popMatrix();

    pushMatrix();
    translate(+30+(float)input[i][0]*50.0f,(float)input[i][1]*50.0f,0.0f);
    translate(0.0f,0.0f,bzp);
    fill(255, 0, 0, 150);
    box(0.5f,0.5f,0.5f);
    popMatrix();

// HIDDEN

    float step=20.0f;
    float factor=30.0f;

    pushMatrix();
    translate(-2*step+(float)input[i][0]*factor,0.0f+(float)input[i][1]*factor,0.0f);
    translate(0.0f,0.0f,bh1);
    fill(100, 100, 255, 150);
    box(1.0f,1.0f,1.0f);
    popMatrix();

    pushMatrix();
    translate(0+(float)input[i][0]*factor,0.0f+(float)input[i][1]*factor,0.0f);
    translate(0.0f,0.0f,bh2);
    fill(100, 100, 255, 150);
    box(1.0f,1.0f,1.0f);
    popMatrix();

    pushMatrix();
    translate(+2*step+(float)input[i][0]*factor,0.0f+(float)input[i][1]*factor,0.0f);
    translate(0.0f,0.0f,bh3);
    fill(100, 100, 255, 150);
    box(1.0f,1.0f,1.0f);
    popMatrix();

    pushMatrix();
    translate(-4*step+(float)input[i][0]*factor,0.0f+(float)input[i][1]*factor,0.0f);
    translate(0.0f,0.0f,bh4);
    fill(100, 100, 255, 150);
    box(1.0f,1.0f,1.0f);
    popMatrix();
    
    pushMatrix();
    translate(+4*step+(float)input[i][0]*factor,0.0f+(float)input[i][1]*factor,0.0f);
    translate(0.0f,0.0f,bh5);
    fill(100, 100, 255, 150);
    box(1.0f,1.0f,1.0f);
    popMatrix();
  }
}

void initData(int tAO) {
  for (int t=0;t<tAO;t+=1) {
    input[t][0]=((double)t/20)/20-0.5;   //Math.random()*2-1;
    input[t][1]=((double)t%20)/20-0.5;   //Math.random()*2-1;
    input[t][2]=1;
    output[t]=0.2*(Math.sin(7.5*input[t][0])+Math.sin(5.7*input[t][1]));
    predicted_output[t]=0;
  }  
            
  for (int i=0;i<observations;i+=1) {
    prediction[i]=new mcBrainNode();
    hidden1[i]=new mcBrainNode();
    hidden2[i]=new mcBrainNode();
    hidden3[i]=new mcBrainNode();
    hidden4[i]=new mcBrainNode();
    hidden5[i]=new mcBrainNode();
  }
}


