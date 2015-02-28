

public class Star{
  private PVector pos;
  private float radius;
  private PImage body;
  private PImage flares;
  private PImage flaresCopy;
  private float timeCounter;

  public Star(PVector pos, float radius, int dim){
    this.pos = pos.get();
    this.radius = radius;
    
    body = createImage(dim, dim, ARGB);
    
    body.loadPixels();
      for(int y = 0; y < body.height; y++){
        for(int x = 0; x < body.width; x++){
          float relDistSq = (sq(x - body.width/2.0) + sq(y - body.height/2.0))/sq(this.radius); 
          body.pixels[x + y*body.width] = color(255, max(0, 255*(0.9 - sq(relDistSq))));
        }
      }
    body.updatePixels();
    
    flares = createImage(dim, dim, ARGB);
    flaresCopy = createImage(dim, dim, ARGB);
    
    timeCounter = 0;
  }

  public void update(float flaresActivity, float fadingFactor){
    timeCounter += flaresActivity;
    
    // Create the gas effect in the star body
    flares.loadPixels();
      for(int y = 0; y < flares.height; y++){
        for(int x = 0; x < flares.width; x++){
          float dist = sqrt(sq(x - flares.width/2.0) + sq(y - flares.height/2.0));
      
          if(dist < radius){
            float relAng = atan2(y - flares.height/2.0, x - flares.width/2.0)/TWO_PI;
        
            if(relAng < 0){
              relAng = 1 + relAng;
            }
        
            flares.pixels[x + y*flares.width] = color(255*noise(0.1*(dist - timeCounter), 10*relAng));
          }
        }
      }
    flares.updatePixels();
  
    // Smooth the flares image
    flares.loadPixels();
    flaresCopy.loadPixels();
      for(int y = 2; y < flares.height - 2; y++){
        for(int x = 2; x < flares.width - 2; x++){
          float sumColor = 0;
          int counter = 0;
          float pixelDistSq = sq(x - flares.width/2.0) + sq(y - flares.height/2.0);
      
          for(int i = -2; i < 3; i++){
            for(int j = -2; j < 3; j++){
              if(!(i == 0 && j == 0)){
                float distSq = sq(x + i - flares.width/2.0) + sq(y + j - flares.height/2.0);
            
                if(distSq < pixelDistSq){
                  sumColor += red(flares.pixels[x + i + (y + j)*flares.width]);
                  counter++;
                }
              }
            }
          }
      
          if(counter > 0){
            float newCol = sumColor/(counter*(1 + fadingFactor));
            flaresCopy.pixels[x + y*flares.width] = color(newCol);
          }
          else{
            flaresCopy.pixels[x + y*flares.width] = color(255, 100);
          }
        }
      }
      
      for(int i = 0; i < flaresCopy.pixels.length; i++){
        flares.pixels[i] = flaresCopy.pixels[i];
      }
    flaresCopy.updatePixels();
    flares.updatePixels();
  }
  
  public void draw(){
    pushMatrix();
      translate(pos.x - body.width/2.0, pos.y - body.height/2.0);
      image(flares, 0, 0);
      image(body, 0, 0);
    popMatrix();
  }

}

