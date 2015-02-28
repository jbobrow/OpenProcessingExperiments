
PImage topoImage, bathyImage, texImage, resultImage;
color[] tex, topo, bathy, result;
Vector<Vector<int[]>> lookup;

int w, h, y = 0;

float startTime;

// choose one of these three
boolean useBestMatch = false;
boolean useWeighted = true;
boolean useOrdered = false;

float gaussianWidth = 4;
int gaussianPasses = 1;
float bathyScale = 1;
float inflection = .1;
String imgsize = "xsmall";

void setup() {
  texImage = loadImage("tex-" + imgsize + ".png");
  size(min(texImage.width, 1024), min(texImage.height, 512));
  
  topoImage = loadImage("topo-" + imgsize + ".png");
  bathyImage = loadImage("bathy-" + imgsize + ".png");
  
  texImage.loadPixels();
  topoImage.loadPixels();
  bathyImage.loadPixels();
  
  h = texImage.height;
  w = texImage.width;
  
  resultImage = createImage(w, h, RGB);
  resultImage.loadPixels();
  
  tex = texImage.pixels;
  topo = topoImage.pixels;
  bathy = bathyImage.pixels;
  result = resultImage.pixels;
  
  lookup = new Vector<Vector<int[]>>();
  for(int i = 0; i < 256; i++) {
    lookup.add(new Vector<int[]>());
  }
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      int i = y * w + x;
      int curbathy = (int) brightness(bathy[i]);
      int curtopo = (int) brightness(topo[i]);
      if(curtopo > 0 && curbathy == 255) {
        for(int j = 0; j < gaussianPasses; j++) {
          curtopo += random(-gaussianWidth, gaussianWidth) / gaussianPasses;
        }
        curtopo = constrain(curtopo, 0, 255);
        int[] position = {x, y};
        lookup.get(curtopo).add(position);
      }
    }
    println("pre: " + ((int) y * 100) / h);
  }
  if(useOrdered) {
    for(int i = 0; i < 256; i++) {
      Collections.shuffle(lookup.get(i));
    }
  }
}

void draw() {
  if(y == 0) {
    startTime = millis();
  }
  if(y < h) {
    float xnorm = TWO_PI / w;
    float ynorm = PI / h;
    
    for(int x = 0; x < w; x++) {
      int i = y * w + x;
      int curbathy = (int) brightness(bathy[i]);
      int curtopo = (int) brightness(topo[i]);
      
      if(curbathy < 255 && curtopo == 0) {
        curbathy *= bathyScale;
        Vector<int[]> curMatches = lookup.get(curbathy);
        
        float lsx = x * xnorm - PI;
        float lsy = y * ynorm - HALF_PI;
  
        if(useBestMatch) {
          float closestDistance = Float.POSITIVE_INFINITY;
          int[] bestPosition = {0, 0};
          for(int j = 0; j < curMatches.size(); j++) {
            int[] curPosition = curMatches.get(j);
            
            float ltx = curPosition[0] * xnorm - PI;
            float lty = curPosition[1] * ynorm - HALF_PI;
            float curDistance = greatCircleDistance(lsx, lsy, ltx, lty);
            
            if(curDistance < closestDistance) {
              closestDistance = curDistance;
              bestPosition = curPosition;
            }
          }
          
          if(closestDistance != Float.POSITIVE_INFINITY) {
            int j = bestPosition[1] * w + bestPosition[0];
            result[i] = tex[j];
          }
        } else if(useWeighted) {
          float total[] = {0, 0, 0};
          float count = 0;
          for(int j = 0; j < curMatches.size(); j++) {  
            int[] curPosition = curMatches.get(j);
            
            float ltx = curPosition[0] * xnorm - PI;
            float lty = curPosition[1] * ynorm - HALF_PI;
            float curDistance = greatCircleDistance(lsx, lsy, ltx, lty);
            
            float weight = (inflection * inflection) / (curDistance * curDistance);
            int curTex = tex[curPosition[1] * w + curPosition[0]];
            total[0] += red(curTex) * weight;
            total[1] += green(curTex) * weight;
            total[2] += blue(curTex) * weight;
            count += weight;
          }
          result[i] = color(total[0] / count, total[1] / count, total[2] / count);
        } else if(useOrdered) {
          float total[] = {0, 0, 0};
          float count = 0;
          
          float closestDistance = PI;
          float curWeight = 1;
          for(int j = 0; j < curMatches.size(); j++) {
            int[] curPosition = curMatches.get(j);
            
            float ltx = curPosition[0] * xnorm - PI;
            float lty = curPosition[1] * ynorm - HALF_PI;
            float curDistance = greatCircleDistance(lsx, lsy, ltx, lty);
            
            if(curDistance < closestDistance) {
              closestDistance = curDistance;
              float weight = (curWeight * curWeight) / (curDistance * curDistance);
              //float weight = curWeight / curDistance;
              curWeight++;
              int curTex = tex[curPosition[1] * w + curPosition[0]];
              total[0] += red(curTex) * weight;
              total[1] += green(curTex) * weight;
              total[2] += blue(curTex) * weight;
              count += weight;
            }
          }
          
          result[i] = color(total[0] / count, total[1] / count, total[2] / count);
        }
      } else {
        result[i] = color(2, 5, 20);
      }
    }
    println(y);
    y++;
  } else if(y == h) {
    resultImage.save("result-" + imgsize + ".png");
    y++;
    float elapsed = millis() - startTime;
    println(elapsed + " ms");
  }
  
  resultImage.updatePixels();
  image(resultImage, 0, 0, width, height);
}

float greatCircleDistance(float lon1, float lat1, float lon2, float lat2) {
  float dlon = lon2 - lon1;
  float dlat = lat2 - lat1;
  float sindlat = sin(dlat / 2);
  float sindlon = sin(dlon / 2);
  float a = sindlat * sindlat + cos(lat1) * cos(lat2) * sindlon * sindlon;
  return 2 * asin(min(1, sqrt(a)));
}

