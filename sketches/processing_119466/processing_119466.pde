

// Press a key to Reset

int k = 15;  //Number of Clusters
int datasize =10000; // Number of data points that are randomly assigned
float[][] dataset = new float[datasize][2];
int[] indices = new int[datasize];
float[][] centroids = new float[k][2];
float[][] centroids_new = new float[k][2];
color[] palette=new color[k];
int screensize = 500;


void setup()
{
  size(500,500);
  frameRate(10);
  for(int i=0;i<datasize;i++) {
    dataset[i][0] = screensize*random(1); 
    dataset[i][1]=  screensize*random(1);
    indices[i] = 0;
  }
  for (int i=0;i<k;i++) palette[i] = color(random(255),random(255),random(255));   
  for (int i=0;i<k;i++) {
    centroids_new[i][0] = 0;
    centroids_new[i][1] = 0;
  }
  SeedGenerators();
}


void draw()
{ 
 background(255,255,255,0);
  calcKmeans();
 for(int i=0;i<datasize;i++) {
   stroke(palette[indices[i]]);
   fill(palette[indices[i]]);
  noStroke();
   ellipse(dataset[i][1],dataset[i][0],5,5);}
}


void calcKmeans()
{  
 for(int i=0;i<k;i++){centroids[i][0] = centroids_new[i][0];centroids[i][1] = centroids_new[i][1];}
 RecomputeCentroids();
 AssignPointstoClusters();
  
}

void SeedGenerators()            
{   for(int i=0;i<k;i++){
        centroids[i][0] = dataset[(int)random(0,datasize)][0];
        centroids[i][1] = dataset[(int)random(0,datasize)][1];}
}

void AssignPointstoClusters()
{   float min_dist;
    float cent_dist;
    for(int i=0;i<datasize;i++){
      min_dist = 999999;
        for(int j=0;j<k;j++){
          cent_dist = dist(dataset[i][0],dataset[i][1],centroids[j][0],centroids[j][1]);
         // println(cent_dist+"  "+j);
          if(cent_dist <= min_dist){
             min_dist = cent_dist; 
             indices[i]=j;
          }       
        }}
}                    

void RecomputeCentroids()
{ float[][] mean = new float[k][2];  
  float [] count = new float[k];
  for(int i=0;i<datasize;i++){
       for(int j=0;j<k;j++){
         if(indices[i]==j){
             mean[j][0]+=dataset[i][0];
             mean[j][1]+=dataset[i][1];
             count[j]+=1;}
    }}
   for(int i=0;i<k;i++){
     centroids[i][0] = mean[i][0]/(count[i]+1);  
     centroids[i][1] = mean[i][1]/(count[i]+1);
   }               
}


void keyPressed() {
 for(int i=0;i<datasize;i++) {
    dataset[i][0] = screensize*random(1);
    dataset[i][1]=  screensize*random(1);
    indices[i] = 0;
  }
}

