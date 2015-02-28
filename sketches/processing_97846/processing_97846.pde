
import java.util.ArrayList;
import java.lang.Character;
import java.lang.Integer;
public PFont font = createFont("Impact", 40);
public PFont font2 = createFont("Impact", 20);

public void setup() {
  size(640, 480);
  textFont(font);
  swapcount = 0;
}

public int swapcount;
public int mode; //0: select sort & list size. 1: sorting display
public int screen_cursor = 0;
public int sort_cursor = 0;
public int list_size = 20;

public int[] list;
public ArrayList<Integer> stock;

public SortAlgorithm sort;

public int gap;
public int thickness;

public void controls() {
  if (list_size < 2) list_size = 2;
  if (sort_cursor > 3) sort_cursor = 3;
  if (sort_cursor < 0) sort_cursor = 0;
}

@Override
public void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case RIGHT:
      if (mode == 0) {
        if (screen_cursor == 0) {
          sort_cursor++;
        }
        else {
          list_size++;
        }
      }
      else {
        sort.next();
      }
      break;
    case DOWN:
      screen_cursor = (screen_cursor + 1) % 2;
      break;
    case LEFT:
      if (mode == 0) {
        if (screen_cursor == 0) {
          sort_cursor--;
        }
        else {
          list_size--;
        }
      }
      else {
      }
      break;
    case UP:
      screen_cursor = (screen_cursor + 1) % 2;
      break;
    }
  }
  else {
    switch(Character.toUpperCase(key)) {
    case 'Q':
      if (mode == 1){
        mode=0;
        swapcount = 0;
      }
      break;
    case '\n':
      if (mode == 0) {
        mode++;
        initSort();
      }
      break;
    }
  }
}



public void initSort() {
  list = new int[list_size];
  
  for (int i = 0; i < list.length; i++) {
    list[i] = i;
  }

  for (int i = list.length - 1; i > 0; i--) {
    int j = (int)random(0,i);
    int k = list[i];
    list[i] = list[j];
    list[j] = k;
  }

  switch(sort_cursor) {
  case 0: 
    sort = new BubbleSort();
    break;
  case 1: 
    if (!(sort instanceof BogoSort)) sort = new BogoSort();
    break;
  case 2: 
    sort = new SelectionSort();
    break;
  case 3: 
    sort = new HeapSort();
    break;
  }
}

public void draw() {
  background(0);
  controls();

  switch(mode) {
  case 0:
    rectMode(RADIUS);
    strokeWeight(3);
    if (screen_cursor == 0) {
      stroke(0, 0, 255);
    }
    else {
      noStroke();
    }
    fill(0, 255, 255);
    rect(width/2, height/2, width/2 - 80, height/2 - 180);

    if (screen_cursor == 1) {
      stroke(0, 0, 255);
    }
    else noStroke();
    fill(0, 255, 255);
    rect(width/2, height/2 + 100, width/2 - 150, height/2 - 220);

    textAlign(CENTER, CENTER);
    fill(0, 0, 0);
    textFont(font);
    switch(sort_cursor) {
    case 0:
      text("Bubblesort", width/2, height/2);
      break;
    case 1:
      text("Bogosort", width/2, height/2);        
      break;
    case 2:
      text("Selection Sort", width/2, height/2);
      break;
    case 3:
      text("HeapSort", width/2, height/2);
      break;
    }

    textFont(font2);
    text("List size: " + list_size, width/2, height/2 + 100);

    break;
  case 1:
    sort.drawSelf();
    textAlign(LEFT,CENTER);
    fill(255);
    text(swapcount + " swaps", 10,10);
    break;
  }
}

class BogoSort implements SortAlgorithm{
    private int pointer;
    public boolean done;
    
    public BogoSort(){
      pointer = 0;
      done = false;
    }
    
    public void next(){
      if(pointer == list.length - 1){
        done = true;
      }else{
        int a = list[pointer];
        int b = list[pointer + 1];
        if(a > b){
          pointer = 0;
          initSort();
          swapcount += list.length - 1;
        }else{
          pointer++;
        }
      }
      
    }
    
    public void drawSelf(){
      rectMode(CORNER);
       stroke(0);
       strokeWeight(8);
       for(int i = 0; i < list.length; i++){
         int k = list[i];
         if(done || i < pointer){
           fill(0,255,0);
         }else if(i == pointer || i == pointer + 1){
           fill(255,0,0);
         }else fill(0,0,255);
         rect(i*width/list.length, height, width/list.length, -(k+1)*height/(list_size));
       }
    }
  }
class BubbleSort implements SortAlgorithm{
    private int pointer;
    private int sorted;
    public boolean done;
    
    public BubbleSort(){
      pointer = 0;
      sorted = -1;
      done = false;
    }
    
    public void next(){
      if(pointer == list.length - 1){
        if(sorted == -1){
        done = true;
        }else{
          pointer = 0; 
          sorted = -1;
        }
      }else{
        int a = list[pointer];
        int b = list[pointer + 1];
        if(a > b){
          list[pointer] = b;
          list[pointer + 1] = a;
          if(sorted == -1) sorted = pointer;
          swapcount++;
        }else{
          pointer++;
        }
      }
    }
    
    public void drawSelf(){
       rectMode(CORNER);
       stroke(0);
       strokeWeight(8);
       for(int i = 0; i < list.length; i++){
         int k = list[i];
         if(done){
           fill(0,255,0);
         }else if(i == pointer || i == pointer + 1){
           fill(255,0,0);
         }else fill(0,0,255);
         rect(i*width/list.length, height, width/list.length, -(k+1)*height/(list_size));
         
       }
    }
}
class HeapSort implements SortAlgorithm {
  public boolean sorting;
  public boolean done;

  public HeapSort() {
    sorting = false;
    done = false;
    pointer = 0;
  }

  public int pointer; //parents are 2*pointer + 1 and 2*pointer + 2
  //nodes go to length/2 - 1

  public int init_k = list.length/2 - 1;

  public void next() {
    if (sifting) {
      sift(stored_larger);
    }
    else if (sorting) {
      if (pointer == list.length) {
        done = true;
      }
      else {
        int temp = list[0];
        list[0] = list[list.length - 1 - pointer];
        list[list.length - 1 - pointer] = temp;
        swapcount++;
        pointer++;
        sift(0);
      }
    }
    else {
      if (init_k >= 0) {
        sift(init_k);
        init_k--;
      }
      else sorting = true;
    }
  }

  public void drawSelf() {
    rectMode(CORNER);
    stroke(0);
    strokeWeight(8);
    
    for (int i = 0; i < list.length; i++) {
      int k = list[i];
      if (done || list.length - i <= pointer) {
        fill(0, 255, 0);
      }
      else if (sorting && i == 0) {
        fill(255, 0, 0);
      }
      else {
        fill(0, 0, 255);
      }
      rect(i*width/list.length, height, width/list.length, -(k+1)*height/(list_size));
      
    }
    
    for (int i = 0; i < list.length; i++) {
      
        
        int k = list[i];
        stroke(255,64);
        strokeWeight(3);
        if(2*i+1 < list.length - pointer){
          int a = list[2*i+1];
          if(a > list[i]) stroke(255,255,0); else stroke(255,127);
          line(i*width/list.length + width/list.length/2, height -(k+1)*height/(list_size), (2*i+1)*width/list.length + width/list.length/2, height -(list[2*i+1]+1)*height/(list_size));
        }
        if(2*i+2 < list.length - pointer){
          int b = list[2*i+2];
          if(b > list[i]) stroke(255,255,0); else stroke(255,127);
          if(2*i+2 < list.length - pointer) line(i*width/list.length + width/list.length/2, height -(k+1)*height/(list_size), (2*i+2)*width/list.length + width/list.length/2, height -(list[2*i+2]+1)*height/(list_size));
        }
        
        stroke(0);
        strokeWeight(8);
      
    }
  }

  private boolean sifting = false;
  private int stored_larger;

  private void sift(int k) {
    int larger = k;
    int a = 2*k + 1;
    int b = 2*k + 2;

    if (a < list.length - pointer && list[a] > list[larger]) larger = a;
    if (b < list.length - pointer && list[b] > list[larger]) larger = b;
    if (larger != k) {
      int temp = list[k];
      list[k] = list[larger];
      list[larger] = temp;
      swapcount++;
      if (2*larger + 1 < list.length - pointer) {
        sifting = true;
        stored_larger = larger;
      }
      else sifting = false;
    }
    else sifting = false;
  }
}

class SelectionSort implements SortAlgorithm{
    public int pointer_i; //first uncleared item
    public int pointer_j; //item being checked
    public int pointer_x;
    public int x; //item currently selected
    public boolean done;
    
    public SelectionSort(){
      pointer_i = 0;
      pointer_j = 0;
    }
    
    public void next(){
      if(pointer_i == list.length - 1){
        done = true;
      }else{
        if(pointer_j == list.length){
          int k = list[pointer_x];
          list[pointer_x] = list[pointer_i];
          list[pointer_i] = k;
          swapcount++;
          pointer_j = pointer_i + 1;
          pointer_i++;
          pointer_x = pointer_i;
         // x = list[pointer_x];
        }else{
          int k = list[pointer_j];
          if(k < list[pointer_x]){
            pointer_x = pointer_j;
          }else{
            pointer_j++;
          }
          
          //pointer_j++;
        }
        
      }
    }
    
    public void drawSelf(){
       rectMode(CORNER);
       stroke(0);
       strokeWeight(8);
       for(int i = 0; i < list.length; i++){
         int k = list[i];
         if(done || i < pointer_i){
           fill(0,255,0);
         }else if(i == pointer_x){
           fill(255,0,0);
         }else if(i == pointer_j){
           fill(255,255,0);         
         }else fill(0,0,255);
         rect(i*width/list.length, height, width/list.length, -(k+1)*height/(list_size)); 
       } 
    }  
 }
interface SortAlgorithm{
    public void next();
    public void drawSelf();
}


