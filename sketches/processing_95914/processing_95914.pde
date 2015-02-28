
int blockscale = 10;
int blockcount = 64;
int spacing = 5;
int minindex;
int compindex;
int sortindex;
PVector compstartingpoint;
PVector minstartingpoint;
column[] unsortedgroup;

void setup(){
  size(965,650);
  unsortedgroup = new column[blockcount];
  for(int i = 0; i < blockcount; i++){
    unsortedgroup[i] = new column(i+1);
  }
  randomize();
  noStroke();
  minindex = 0;
  compindex = 0;
  sortindex = 1;
}

void draw(){
  background(207);
  if(compindex < blockcount){
    sel_sort();
  }
  for(int i = 0; i < blockcount; i++){
    unsortedgroup[i].drew(i);
  }
  stroke(255,0,0);
  noFill();
  curve(compstartingpoint.x,blockscale*blockcount + 2 * spacing,compstartingpoint.x, compstartingpoint.y, minstartingpoint.x, minstartingpoint.y, minstartingpoint.x, blockscale*blockcount + 2 * spacing);
  noStroke();
}

void randomize(){
  ArrayList temp = new ArrayList();
  for(column c: unsortedgroup){
    temp.add(c);
  }
  int rand;
  for(int i = 0; i < blockcount; i++){
    rand = int(random(temp.size()));
    unsortedgroup[i] = (column)temp.get(rand);
    temp.remove(rand);
  }
}

void sel_sort() {
   compstartingpoint = new PVector(compindex*(blockscale+spacing)+spacing+blockscale*.5, blockscale*(blockcount-unsortedgroup[compindex].value)+spacing);
   minstartingpoint = new PVector(minindex*(blockscale+spacing)+spacing+blockscale*.5, blockscale*(blockcount-unsortedgroup[minindex].value)+spacing);
   if(sortindex < blockcount){
     if(unsortedgroup[sortindex].value < unsortedgroup[minindex].value){
       minindex = sortindex;
     }
     sortindex++;
   }else {
     column temp = unsortedgroup[compindex];
     unsortedgroup[compindex] = unsortedgroup[minindex];
     unsortedgroup[minindex] = temp;
     compindex++;
     minindex = compindex;
     sortindex = minindex+1;
   }
}


class column {
  int value;
  color cool;
  public column(int n){
    value = n;
    cool = color(56);
  }
  public void drew(int n){
    fill(cool);
    rect(n*(blockscale+spacing)+spacing,blockscale*(blockcount-value)+spacing,blockscale,(blockscale)*value);
  }
  public String toString(){
    return "" + value;
  }
}



