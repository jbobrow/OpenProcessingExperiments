
int linepos[];
Lines k;
void setup() {  //setup function called initially, only once
  size(400, 200);
  background(0);
  stroke(255);
  int linepos[] = chooseLines();
  k = new Lines(linepos);
}

void draw() {
  k.draw();
}

class Lines    {
  int start[];
  int end[] = {};
  Lines(int[] l){
    start = l;
    for(int x = 0; x < start.length; x++)  {
      int r = int(random(0, 3));
      if(r == 0)  {
        end = append(end, start[x]);
      }
      else if(start[x] > 300)  {
        int t = start[x] - 150;
        end = append(end, (start[x] - 150));
      }
      else  {
        end = append(end, (start[x] + 150));
      }
    }
  }
  void draw()  {
    for(int x = 0; x < start.length; x++){
      line(start[x], 0, end[x], height);
    }
  }
}
int[] chooseLines()    {
    int[] chosen = {};
    for(int a = 0; a < 600; a++)    {
        float d = pow(abs((a - 300)), .1);
        float r = random(pow(300, .1));
        if(r > d)    {
            chosen = append(chosen, a);
        }
    }
    return chosen;
}
