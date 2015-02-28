
/*
https://explore.data.gov/Foreign-Commerce-and-Aid/U-S-Overseas-Loans-and-Grants-Greenbook-/5gah-bvex
*/
float[] greece = {0,1578869699.00,1221893297.00,807936019.00,1189097268.00,1221994480.00,800360520.00,401676770.00,114015466.00,201581760.00,773508983.00,265296542.00,749650147.00,800194685.00,721565728.00,605683902.00,566714457.00,365535206.00,468716979.00,571833982.00,504037784.00,350853650.00,638447284.00,324147071.00,455160121.00,477455750.00,330337791.00,260295015.00,300181707.00,613286880.00,107658301.00,443804951.00,496283050.00,448995666.00,354523488.00,392260384.00,581438492.00,554195861.00,952668118.00,922593063.00,776732959.00,602898176.00,584020093.00,523979605.00,550134683.00,532258185.00,518353073.00,481368899.00,411656786.00,348511462.00,357098030.00,168802526.00,2711373.00,58150993.00,21363723.00,6514610.00,883274.00,9098609.00,666938.00,1166767.00,34925018.00,886174.00,748581.00,360199.00,148880.00,98000.00};
float[] philippines = {217854406.00,378801400.00,455033988.00,132123243.00,174311322.00,347876253.00,115540640.00,42939342.00,82448718.00,222209416.00,79055407.00,193844042.00,154606077.00,212950461.00,257977819.00,92427238.00,129750056.00,131988343.00,130204550.00,137368845.00,177161795.00,155532360.00,106163671.00,128469916.00,80959423.00,88288308.00,204282623.00,101707867.00,119842311.00,134298370.00,68194114.00,111250461.00,103449432.00,84237913.00,181947172.00,164912679.00,106696057.00,102286924.00,99173491.00,50055201.00,4384776.00,16811011.00,216261494.00,4140323.00,240775624.00,296763651.00,46369940.00,25395150.00,1243830.00,2975201.00,1648672.00,1732150.00,1687969.00,13697889.00,6165651.00,8075657.00,69357869.00,65160139.00,44688379.00,43501312.00,41096472.00,46841403.00,33731818.00,37984094.00,36254368.00,26332698.00};
float[] turkey = {0,547511267.00,642899120.00,862668657.00,1261068008.00,1350337660.00,1167310591.00,2360278685.00,153855258.00,1269123237.00,587645841.00,968831744.00,1297470457.00,834066650.00,911600207.00,1117745077.00,1072069455.00,704181640.00,837277052.00,833831234.00,1015653293.00,900730371.00,896052589.00,859560946.00,965752529.00,958319648.00,999752163.00,751338669.00,370623184.00,407073310.00,394641866.00,378763656.00,497075059.00,476778127.00,498009595.00,555241471.00,712443768.00,577201897.00,1117512724.00,1294157522.00,741937121.00,317610221.00,837557984.00,709374249.00,789895401.00,964693289.00,744748359.00,705160665.00,584922803.00,501410196.00,589140505.00,236956162.00,7559588.00,20311686.00,4716873.00,2293707.00,87949090.00,24565968.00,46963953.00,42581317.00,19659043.00,19021342.00,10201706.00,4444857.00,5216925.00,4843000.00};
float[] data1;
float[] data2;
float[] data3;
float[] mindistances;
int[] colors;
int datasize;
float xrot;
float yrot;
boolean[] directions = {false, false, false, false};
float datamin;
float datamax;

void setup() {
  size(600,600, P3D);
  data1 = greece;
  data2 = philippines;
  data3 = turkey;
  datasize = data1.length;
  xrot = 0;
  yrot = 0;
  datamin = Float.POSITIVE_INFINITY;
  datamax = Float.NEGATIVE_INFINITY;
  mindistances = new float[datasize];
  colors = new int[datasize];
  float[][] distances = new float[datasize][datasize];
  for (int i = 0; i < datasize; i++) {
    colors[i] = i;
  }
  for (int i = 0; i < datasize; i++) {
    for (int j = 0; j < i; j++) {
      distances[i][j] = distances[j][i];
    }
    distances[i][i] = Float.POSITIVE_INFINITY;
    for (int j = i+1; j < datasize; j++) {
      distances[i][j] = distance(i,j);
    }
    mindistances[i] = min(distances[i]);
    if (data1[i] == data1[i]) {
      if (max(data1[i],data2[i],data3[i]) > datamax) {
        datamax = max(data1[i],data2[i],data3[i]);
      }
      if (min(data1[i],data2[i],data3[i]) < datamin) {
        datamin = min(data1[i],data2[i],data3[i]);
      }
    }
  }
  strokeWeight(5);
  for (int i = 0; i < datasize; i++) {
    data1[i] = (data1[i]-datamin)/(datamax-datamin);
    data2[i] = (data2[i]-datamin)/(datamax-datamin);
    data3[i] = (data3[i]-datamin)/(datamax-datamin);
  }
}

void draw() {
  background(0);
  float thresh = 1.2*max(mindistances)*(float)mouseX/ (float)width;
  translate(width/2,height/2,0);
  colorMode(HSB,100,100,100,100);
  scale(200);
  pointLight(100,0,60,1,1,1);
//  pointLight(100,0,60,1,1,-1);
//  pointLight(100,0,60,1,-1,1);
  pointLight(100,0,60,1,-1,-1);
//  pointLight(100,0,60,-1,1,1);
  pointLight(100,0,60,-1,1,-1);
  pointLight(100,0,60,-1,-1,1);
  pointLight(100,0,60,-1,-1,-1);
  rotateX(radians(xrot));
  rotateY(radians(yrot));
  translate(-.5,-.5,-.5);
  stroke(33,100,100,50);//green x greece
  line(0,0,0,1,0,0);
  stroke(66,100,100,50);//blue y philippines
  line(0,0,0,0,1,0);
  stroke(99,100,100,50);//red z turkey
  line(0,0,0,0,0,1);
  stroke(0,0,100,50);
  line(0,0,0,.5,.5,.5);
  stroke(0,0,0,0);
  fill(16,25,50,60);
  pushMatrix();
  rotateX(radians(90));
  rect(0,0,1,1);
  popMatrix();
  fill(83,25,50,60);
  pushMatrix();
  rotateY(radians(90));
  rotateZ(radians(90));
  rect(0,0,1,1);
  popMatrix();
  fill(50,25,50,60);
  rect(0,0,1,1);
  for (int i = 0; i < datasize; i++) {
    colorMode(HSB,datasize,100,100,100);
    if (mindistances[i] < thresh) {
      //stroke(colors[i],60,70,70);
      //line(data1[i],data2[i],data3[i],data1[i],data2[i],data3[i]);
      stroke(0,0,0,0);
      fill(.9*colors[i],60,100);
      pushMatrix();
      translate(data1[i],data2[i],data3[i]);
      box(5f/200);//5 pixel box size divided by 200x scale
      popMatrix();
    }
  }
  if (directions[0]) {
    yrot = (yrot+2.5)%360;
  }
  if (directions[1]) {
    yrot = (yrot-2.5)%360;
  }
  if (directions[2]) {
    xrot = (xrot+2.5)%360;
  }
  if (directions[3]) {
    xrot = (xrot-2.5)%360;
  }
}

float distance(int a, int b) {
  float x = data1[a]-data1[b];
  float y = data2[a]-data2[b];
  float z = data3[a]-data3[b];
  float distance = (float)Math.sqrt(x*x+y*y+z*z);
  return distance;
}
void keyPressed() {
  if (keyCode == RIGHT || key == 'd' || key == 'D') {
    directions[0] = true;
  }
  if (keyCode == LEFT || key == 'a' || key == 'A') {
    directions[1] = true;
  }
  if (keyCode == UP || key == 'w' || key == 'W') {
    directions[2] = true;
  }
  if (keyCode == DOWN || key == 's' || key == 'S') {
    directions[3] = true;
  }
}
void keyReleased() {
  if (keyCode == RIGHT || key == 'd' || key == 'D') {
    directions[0] = false;
  }
  if (keyCode == LEFT || key == 'a' || key == 'A') {
    directions[1] = false;
  }
  if (keyCode == UP || key == 'w' || key == 'W') {
    directions[2] = false;
  }
  if (keyCode == DOWN || key == 's' || key == 'S') {
    directions[3] = false;
  }
}

float geomean(float[] f) {
  float total = 1;
  for (int i = 0; i < f.length; i++) {
    if (f[i] == f[i]) {
      total *= f[i];
    }
  }
  float ans = (float) Math.pow((double)total, Math.pow(f.length, -1));
  println(ans);
  return ans;
}

float mean(float[] f) {
  float total = 0;
  for (int i = 0; i < f.length; i++) {
    if (f[i] == f[i]) {
      total += f[i];
    }
  }
  float ans = total/f.length;
  return ans;
}

