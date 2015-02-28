
import processing.pdf.*;
boolean savePDF = false;

letterB   b=new letterB();
letterR   r=new letterR();
letterE1 e1=new letterE1();
letterA   a=new letterA();
letterT   t=new letterT();
letterH   h=new letterH();
letterE2  e=new letterE2();

void setup(){
  size(1000,600);
  smooth();
}

void draw(){
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  background(245,245,245);
  b.display();
  r.display();
  e1.display();
  a.display();
  t.display();
  h.display();
  e.display();
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

  class letterA{
  float[] x={523.547,523.547,514.172,493.209,482.000,475.546,
             473.323,478.638,489.594,512.297,514.172,514.172,
             517.860,495.376,479.290,473.323,461.936,450.550,
             458.502,476.936,512.008,536.410,543.803,543.803,
             549.380,561.174,562.621,551.049,529.355,517.969,
             516.346,514.578,485.794,460.850,445.124,443.859,
             452.355,478.021,514.172,523.547};
  float[] y={286.118,298.196,299.946,304.467,309.344,317.941,
             331.760,346.033,351.643,344.051,342.971,271.750,
             250.263,242.827,249.515,270.304,275.544,265.602,
             248.792,238.126,230.896,239.392,269.218,339.713,
             355.308,355.260,359.961,366.467,366.649,355.260,
             351.284,352.375,366.831,366.106,349.114,330.760,
             314.770,301.032,289.101,286.118};
  
  letterA(){    
    
    
  }
  
  void display(){
    noStroke();
    fill(25,25,25,250);
    
    float tightness=map(sin(frameCount*0.045),-1,1,0,1);
    curveTightness(tightness);
    beginShape();
    for(int i=0;i<3;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[1],y[1]);
    for(int i=2;i<12;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[11],y[11]);
    for(int i=11;i<27;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[26],y[26]);
    for(int i=26;i<31;i++){
      curveVertex(x[i],y[i]);
    }    
    vertex(x[30],y[30]);
    vertex(x[31],y[31]);
    for(int i=30;i<39+1;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[39],y[39]);
    endShape(CLOSE);
  }
}

class letterB{
  float[] x={88.499,79.376,75.039,78.391,98.525,115.609,118.502,
             118.502,127.340,150.357,168.977,177.427,168.197,
             147.827,127.943,118.502,110.098,110.038,118.502,
             134.940,160.481,193.017,207.479,182.535,144.905,
             111.313,97.943,88.898,88.499};
  float[] y={176.401,176.401,172.967,168.773,162.294,155.572,
             158.466,344.194,350.535,356.850,344.377,300.451,
             260.204,247.307,256.345,267.914,286.973,260.444,
             250.561,237.783,231.401,244.235,290.689,349.256,
             368.418,364.622,358.985,353.235,176.401};
  
  letterB(){    
    
    
  }
  
  void display(){
    noStroke();
    fill(25,25,25,250);
    
    float tightness=map(sin(frameCount*0.045),-1,1,0,1);
    curveTightness(tightness);
    beginShape();
    for(int i=0;i<7;i++){
      curveVertex(x[i],y[i]);     
    }    
    vertex(x[5],y[5]);
    vertex(x[6],y[6]);
    vertex(x[7],y[7]);
    for(int i=7;i<27+1;i++){
      curveVertex(x[i],y[i]);
    }    
    vertex(x[27],y[27]);
    vertex(x[28],y[28]);
    endShape(CLOSE);
  }
}

class letterE1{
  float x[]={342.901,342.901,414.526,427.425,415.135,384.045,
             342.469,324.031,339.396,379.706,414.412,427.425,
             423.088,415.857,385.082,363.438,354.941,350.734,
             358.919,377.898,390.010,397.780,399.950,389.219,
             342.901};
  float y[]={277.896,289.058,289.101,276.812,244.237,230.896,
             250.239,299.946,349.836,368.999,354.899,340.436,
             335.739,341.522,347.307,329.954,311.334,283.118,
             254.034,242.465,248.069,260.179,272.290,277.896,
             277.896};
  
  letterE1(){
  }
  
  void display(){
    noStroke();
    fill(25,25,25,250);
    
    float tightness=map(sin(frameCount*0.045),-1,1,0,1);
    curveTightness(tightness);
    beginShape();
    for(int i=0;i<3;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[1],y[1]);
    vertex(x[2],y[2]);
    for(int i=1;i<13;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[12],y[12]);
    for(int i=12;i<24+1;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[24],y[24]); 
    endShape(CLOSE);
  }
}
    
    class letterE2{
  float x[]={843.686,843.686,915.311,928.209,915.919,884.829,
             843.253,824.815,840.181,880.490,915.196,928.209,
             923.872,916.642,885.831,864.222,855.726,851.519,
             859.703,878.683,890.794,898.564,900.734,890.004,
             843.686};
  float y[]={277.896,289.085,289.101,276.812,244.273,230.896,
             250.239,299.946,349.836,368.999,354.899,340.436,
             335.739,341.522,347.307,329.954,311.334,283.118,
             254.034,242.465,248.069,260.179,272.290,277.896,
             277.896};
  
  letterE2(){
  }
  
  void display(){
    noStroke();
    fill(25,25,25,250);
    
    float tightness=map(sin(frameCount*0.045),-1,1,0,1);
    curveTightness(tightness);
    beginShape();
    for(int i=0;i<3;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[1],y[1]);
    vertex(x[2],y[2]);
    for(int i=1;i<13;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[12],y[12]);
    for(int i=12;i<24+1;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[24],y[24]); 
    endShape(CLOSE);
  }
}
    class letterH{
  float[] x={683.891,673.768,669.431,672.782,691.469,710.627,
             713.453,713.520,715.281,737.564,761.240,786.908,
             796.307,796.307,809.770,815.469,809.770,781.484,
             752.457,747.145,752.457,766.656,766.656,758.709,
             742.443,725.631,715.520,713.520,713.520,726.979,
             732.680,726.979,698.697,670.098,664.371,670.098,
             683.891,683.891};
  float[] y={176.667,176.667,173.233,169.040,163.292,155.699,
             159.315,252.951,251.081,235.957,230.896,242.104,
             277.534,344.285,358.155,362.852,367.190,366.467,
             367.190,362.852,358.155,344.285,277.534,253.854,
             247.525,253.854,263.742,266.326,344.285,358.155,
             362.852,367.190,366.467,367.190,362.852,358.155,
             344.285,176.667};
  
  letterH(){
  }
  
  void display(){
    noStroke();
    fill(25,25,25,250);
    
    float tightness=map(sin(frameCount*0.045),-1,1,0,1);
    curveTightness(tightness);
    beginShape();
    for(int i=0;i<7;i++){
      curveVertex(x[i],y[i]); 
    }
    for(int i=5;i<8;i++){
      vertex(x[i],y[i]); 
    }
    for(int i=7;i<14;i++){
      curveVertex(x[i],y[i]); 
    }
    vertex(x[13],y[13]);
    for(int i=12;i<23;i++){
      curveVertex(x[i],y[i]); 
    }
    vertex(x[22],y[22]);
    for(int i=21;i<27;i++){
      curveVertex(x[i],y[i]); 
    }
    for(int i=26;i<29;i++){
      vertex(x[i],y[i]);
    }
    for(int i=27;i<38;i++){
      curveVertex(x[i],y[i]); 
    }    
    vertex(x[37],y[37]);
    endShape(CLOSE);
  }
}
    
    class letterR{
  float x[]={237.274,227.151,222.814,226.166,244.506,263.244,
             266.859,266.918,269.459,282.285,307.412,319.703,
             308.493,299.457,288.973,269.276,266.981,266.918,
             281.381,286.081,281.381,252.097,222.453,218.116,
             222.453,237.274,237.274};
  float y[]={251.865,251.865,248.431,244.237,238.309,230.896,
             234.511,254.756,252.345,241.379,230.896,244.634,
             260.179,255.659,251.865,262.763,264.880,343.196,
             358.155,362.852,367.190,366.467,367.190,362.852,
             358.155,343.196,251.865};
  
  letterR(){
  }
  
  void display(){
    noStroke();
    fill(25,25,25,250);
    
    float tightness=map(sin(frameCount*0.045),-1,1,0,1);
    curveTightness(tightness);
    beginShape();
    for(int i=0;i<7;i++){
      curveVertex(x[i],y[i]); 
    }
    for(int i=5;i<8;i++){
      vertex(x[i],y[i]);
    }
    for(int i=7;i<16;i++){
      curveVertex(x[i],y[i]);
    }
    for(int i=15;i<18;i++){
      vertex(x[i],y[i]);
    }
    for(int i=16;i<26+1;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[26],y[26]);
    
    endShape();
  }
}
    
   class letterT{
  float[] x={584.631,573.062,573.062,595.734,609.920,614.260,
             614.260,653.682,649.705,614.260,614.260,620.781,
             636.648,653.682,657.656,634.617,616.805,591.496,
             584.631,584.631};
  float[] y={247.166,247.166,241.019,221.055,196.552,196.552,
             233.064,233.064,247.166,247.166,327.422,345.319,
             353.131,347.667,355.622,366.379,368.999,355.442,
             327.422,247.166};
  
  letterT(){
  }
  
  void display(){
    noStroke();
    fill(25,25,25,250);
    
    float tightness=map(sin(frameCount*0.045),-1,1,0,1);
    curveTightness(tightness);
    beginShape();
    for(int i=0;i<3;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[1],y[1]);
    vertex(x[2],y[2]);
    for(int i=2;i<6;i++){
      curveVertex(x[i],y[i]);
    }
    for(int i=5;i<11;i++){
      vertex(x[i],y[i]);
    }
    for(int i=9;i<15;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[14],y[14]);
    for(int i=13;i<19+1;i++){
      curveVertex(x[i],y[i]);
    }
    vertex(x[19],y[19]);    
    endShape();
  }
}
    


  
