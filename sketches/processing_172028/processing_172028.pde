
int N =  5;
float start, end;

// Storage for transition probabilities
float []probs = new float[N];

int res=40; // How much to resolve the trajectory of the jump

int i=0; // index for animation

float orient = 1;

void setup(){
  background(230);
  size(500,500);
  smooth();

  frameRate(30);

  // Populate probability table
  for(int i=0; i<N;i++){
    probs[i] = float(i)/N; 
  }


  start = 0;
  // Pick first "end" for jump.
  float u = random(1);
  for(int i=0;i<N;i++){
    if(u<probs[i]){
        end = i;
        break;
    }
      
  }
}

void draw(){

   float nstart =  map(start,0, N, 0, width);
   float nend = map(end, 0, N, 0, height);
   float mid = (nstart+nend)/2.0;
   float hf  = (nend-nstart)/2.0;
    
   stroke(100);
   strokeWeight(10);
   line(0,height/2.0,width,height/2.0); 
   float xpoint = mid -  hf * cos(orient*i/float(res)*PI);
   float ypoint = height/2.0 - hf * sin(orient*i/float(res)*PI);
    strokeWeight(10);
    stroke(255,0,0);
    point(xpoint,ypoint);
    i++;

    if(i==res){
      if(end>0){ // Time to return back.
        start = end;
        end = end - 1;
        orient = -1;
      }
      else{
        // You are at zero. Pick new destination. 
        background(230);
        float u = random(1);
        start = 0;
        for(int i=0;i<N;i++){
          if(u<probs[i]){
            end = i;
            break;
          }
        }
        orient = 1;
       }
       // Restart movement
       i = 0;
    }
    
}


