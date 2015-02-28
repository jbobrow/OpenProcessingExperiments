
//import org.json.*;

String RTScore[];
//JSONObject RTScore, PB, WG;
void setup() {
  size(480, 360);
  background(70);
  stroke(255);
  smooth();
  noLoop();
  RTScores = loadStrings
  //JSONObject RTScore = $.get('https://dl.dropboxusercontent.com/s/2ahm485wh3ztdgw/critics_score.json');
  //JSONArray RTScore, PB, WG;
   
  



}


void draw(){
    

    
   
    

    
    String movie1 = "Avatar";
    String movie2 = "Marci X";
    String movie3 = "The Dark Knight";
    
    
   /*
    float score1  = RTScore.getInt(movie1)/float(12);
      float budget1 = PB.getInt(movie1)/100/2783918.982;
    float gross1  = WG.getFloat(movie1)/100/2783918.982;
        
    float score2  = RTScore.getInt(movie2)/float(12);
    float budget2 = PB.getInt(movie2)/100/2783918.982;
    float gross2  = WG.getFloat(movie2)/100/2783918.982;
    
    float score3  = RTScore.getInt(movie3)/float(12);
    float budget3 = PB.getInt(movie3)/100/2783918.982;
    float gross3  = WG.getFloat(movie3)/100/2783918.982;    
    
    projection(score1, gross1, budget1, movie1);
    projection(score2, gross2, budget2, movie2);
    projection(score3, gross3, budget3, movie3);
    */
    projection(7, 8, 4, movie1);
    projection(5, 6, 3, movie2);
    projection(3, 4.6, 2, movie3);

    /*
    println("projection(" + score1 + ", " + gross1 + ", " + budget1 + ", " + "'" + movie1 + "');");
    println("projection(" + score2 + ", " + gross2 + ", " + budget2 + ", " + "'" + movie2 + "');");
    println("projection(" + score3 + ", " + gross3 + ", " + budget3 + ", " + "'" + movie3 + "');");
    */
}

void projection(float RT, float L, float G, String MovieName){
   
  float inicio = 100;
  line(inicio, 0, inicio, 360);
  line(460, 0, 460, 360);
  float a=G;
  textAlign(RIGHT);
  strokeWeight(0.01);
  if (a<=L){
    text(MovieName+" ", inicio, 360-RT*36+4); 
    while (a<=L) {
      smooth(8);
      line(inicio, 360-RT*36, 460, 360-a*36);
      a=a+0.012;
    }
  }
   else if (a>L){
     fill(0,0,0);
     text(MovieName+" ", inicio, 360-RT*36+4); 
     fill(255,255,255);
     while (a>L) {
      smooth(8);
      line(inicio, 360-RT*36, 460, 360-a*36);
      a=a-0.012;
      }
   }
 
}

 
