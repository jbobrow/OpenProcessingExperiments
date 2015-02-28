
int data_start = 0;
int data_length = 12;
int l=10, r=90;
int a=90, b=10;
void setup()
{
  size(200,300);
}
void draw() {
  String data[] = loadStrings("cardiffdata.txt");
  data = subset(data, 7);
  data = trim(data);
  float rain[] = new float[data.length];
  float Mint[] = new float[data.length];
  float maxtemp[] = new float[data.length];
  
  for(int i=0; i<data.length; i++)
  {
    String fields[] = splitTokens(data[i]);
    float values[] = float(fields);
    
    rain[i] = values[5];
    Mint[i] = values[3];
    maxtemp[i] = values[2];
    
  }
  
  float rainfall[] = subset(rain, data_start, data_length);
  float mintemp[] = subset(Mint, data_start, data_length);
  float maxt[] = subset(maxtemp, data_start, data_length);
  
  for( int u=0 ; u<rainfall.length; u++)
  {
    float px = map(u,0,rainfall.length,l,r);
    float pmax = max(rainfall);
    float pmin = min(rainfall);
    float py = map(rainfall[u],pmin,pmax,a,b);
    stroke(100, 140,100);
    line(px,py,px, a);
    textSize(10);
    text("average rain", 110, 70); 
    fill(100, 140,100);

  }
  
  for ( int u=0 ; u<mintemp.length; u++)
  {
    float px = map(u,0,mintemp.length,l,r);
    float pmax = max(mintemp);
    float pmin = min(mintemp);
    float py = map(mintemp[u],pmin,pmax,a+90,b+90);
    stroke(0, 0,255);
    line(px,py,px, a+90);
     textSize(10);
    text("min temp", 110, 150); 
    fill(0, 0, 225);
    
  }
  
  for( int u=0 ; u<maxt.length; u++)
  {
    float px = map(u,0,maxt.length,l,r);
    float pmax = max(maxt);
    float pmin = min(maxt);
    float py = map(maxt[u], pmin,pmax,a+180,b+180);
    stroke(255, 0,0);
    line(px,py,px, a+180);
     textSize(10);
    text("max temp", 110, 240); 
    fill(255, 0, 0);
  }
  


}
    


