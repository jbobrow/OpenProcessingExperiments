
class Composition{
  //Properties
  int num;
  int index;
  int[] x, y;

  //Constructors
  Composition(int point_num){
    this.num = point_num;
    this.x = new int[point_num];
    this.y = new int[point_num];
  }

  //Methods
  void create_point(){
    for(int i = 0; i < this.num; i++){
      this.x[i] = int(random(0, width/40)) * 40;
      this.y[i] = int(random(0, height/40)) * 40;
    }
    check_point();
  }

  void check_point(){
    int xcount = 0;
    int ycount = 0;
    for(int i = 0; i < this.num; i++){
      if(this.x[i] == 0){
        this.x[i] = -40;
      }
      if(this.y[i] == 0){
        this.y[i] = -40;
      }
      for(int j = 0; j < i; j++){
        if(this.x[j] == this.x[i]){
          xcount++;
        }
        if(this.y[j] == this.y[i]){
          ycount++;
        }
      }
      if(xcount == 2){
        this.x[i] = width / 2;
      }
      if(ycount == 2){
        this.y[i] = height / 2;
      }
      xcount = 0;
      ycount = 0;
    }
  }

  void display(){
    for(int i = 0; i < this.num; i++){
      point(this.x[i], this.y[i]);
    }    
  }

  void create_line(){
    for(int i = 0; i < this.num; i++){
      int selectx = floor(random(0, 3));
      int selecty = floor(random(1, 3));
      if(selectx == 1 || selectx == 2){
        selecty = 0;
      }
      if(this.x[i] > 0){
        if(selecty == 0){
          line(this.x[i], 0, this.x[i], height);
        } 
        else if(selecty == 1){
          line(this.x[i], this.y[i], this.x[i], height);
        } 
        else {
          if(this.y[i] > 0){
            line(this.x[i], 0, this.x[i], this.y[i]);
          }
        }
      }
      if(this.y[i] > 0){
        if(selectx == 0){
          line(0, this.y[i], width, this.y[i]);
        } 
        else if(selectx == 1){
          line(this.x[i], this.y[i], width, this.y[i]);
        } 
        else {
          if(this.x[i] > 0){
            line(0, this.y[i], this.x[i], this.y[i]);
          }
        }
      }
    }
  }

  void create_rect(){
    int[] index = new int[3];
    int[] rect_width = new int[3];
    int[] rect_height = new int[3];
    int over_size = 0;

    index[0] = int(random(this.num));
    rect_width[0] = int(random(1, 3.5)) * 40;
    rect_height[0] = int(random(1, 3.5)) * 40;
    if(rect_width[0] == rect_height[0]){
      if(rect_height[0] == 40){
        rect_width[0] += 40;
      } 
      else {
        rect_height[0] -= 40;
      }
    }
    over_size = check_rect(index[0], rect_width[0], rect_height[0]);
    if(over_size == 1){
      rect_width[0] += 40;
    } 
    else if(over_size == 2){
      rect_height[0] += 40;
    } 
    else if(over_size == 3){
      rect_width[0] += 40;
      rect_height[0] += 40;
    }
    rect_line(index[0], rect_width[0], rect_height[0]);

    index[1] = index[0] + 1;
    rect_width[1] = int(random(1, 4)) * 40;
    rect_height[1] = int(random(1, 4)) * 40;
    if(index[1] >= this.num){
      index[1] -= this.num;
    }
    if(rect_width[1] == rect_height[1]){
      if(rect_width[1] == 40){
        rect_height[1] += 40;
      } 
      else {
        rect_width[1] -= 40;
      }
    }
    over_size = check_rect(index[1], rect_width[1], rect_height[1]);
    if(over_size == 1){
      rect_width[1] += 40;
    } 
    else if(over_size == 2){
      rect_height[1] += 40;
    } 
    else if(over_size == 3){
      rect_width[1] += 40;
      rect_height[1] += 40;
    }
    rect_line(index[1], rect_width[1], rect_height[1]);

    index[2] = index[1] + 1;
    rect_width[2] = int(random(2.5, 5)) * 40;
    rect_height[2] = int(random(2.5, 5)) * 40;    
    if(index[2] >= this.num){
      index[2] -= this.num;
    }
    if(rect_width[2] == rect_height[2]){
      if(rect_width[2] == 160){
        rect_width[2] -= 40;
      } 
    }
    if((rect_width[2] == rect_width[1] && rect_height[2] == rect_height[1]) && (rect_width[2] == rect_width[0] && rect_height[2] == rect_height[0])){
      rect_height[2] += 40;
    }
    over_size = check_rect(index[2], rect_width[2], rect_height[2]);
    if(over_size == 1){
      rect_width[2] += 40;
    } 
    else if(over_size == 2){
      rect_height[2] += 40;
    } 
    else if(over_size == 3){
      rect_width[2] += 40;
      rect_height[2] += 40;
    }
    rect_line(index[2], rect_width[2], rect_height[2]);
    
    fill(50, 50, 180);
    rect(this.x[index[0]], this.y[index[0]], rect_width[0], rect_height[0]);

    fill(240, 240, 00);
    rect(this.x[index[1]], this.y[index[1]], rect_width[1], rect_height[1]);

    fill(200, 0, 0);
    rect(this.x[index[2]], this.y[index[2]], rect_width[2], rect_height[2]);
  }

  int check_rect(int point_index, int rect_width, int rect_height){
    if(this.x[point_index] + rect_width == width || this.x[point_index] + rect_width == 0){
      if(this.y[point_index] + rect_height == height || this.y[point_index] + rect_height == 0){
        return 3;
      } 
      else {
        return 1;
      }
    } 
    else {
      if(this.y[point_index] + rect_height == height || this.y[point_index] + rect_height == 0){
        return 2;
      } 
      else {
        return 0;
      }
    }
  }

  void rect_line(int point_index, int rect_width, int rect_height){
    if(this.y[point_index] + rect_height < height / 2 && this.x[point_index] + rect_width < width){
      if(this.y[point_index] + rect_height > 0){
        line(0, this.y[point_index] + rect_height, width, this.y[point_index] + rect_height);
      }   
      if(this.x[point_index] + rect_width < width / 2){
        if(this.x[point_index] + rect_width > 0){
          line(this.x[point_index] + rect_width, 0, this.x[point_index] + rect_width, this.y[point_index] + rect_height);
        }
        if(this.y[point_index] > 0){
          line(0, this.y[point_index], this.x[point_index], this.y[point_index]);
        }
      } 
      else {
        if(this.x[point_index] > 0){
          line(this.x[point_index], 0, this.x[point_index], this.y[point_index] + rect_height);
        }
        if(this.y[point_index] > 0){
          line(this.x[point_index] + rect_width, this.y[point_index], width, this.y[point_index]);
        }        
      }
    } 
    else if(this.y[point_index] + rect_height < height && this.x[point_index] + rect_width < width){
      if(this.y[point_index] > 0){  
        line(0, this.y[point_index], width, this.y[point_index]);
      }
      if(this.x[point_index] + rect_width < width / 2){
        if(this.x[point_index] + rect_width > 0){
          line(this.x[point_index] + rect_width, this.y[point_index] + rect_height, this.x[point_index] + rect_width, height);
        }
        if(this.y[point_index] + rect_height > 0){
          line(0, this.y[point_index] + rect_height, this.x[point_index], this.y[point_index] + rect_height);
        }
      } 
      else {
        if(this.x[point_index] > 0){
          line(this.x[point_index], this.y[point_index] + rect_height, this.x[point_index], height);
        }
        if(this.y[point_index] + rect_height > 0){
          line(this.x[point_index] + rect_width, this.y[point_index] + rect_height, width, this.y[point_index] + rect_height);        
        }
      }
    }
    else if(this.y[point_index] + rect_height >= height && this.x[point_index] + rect_width < width){
      if(this.x[point_index] + rect_width > 0){
        line(this.x[point_index] + rect_width, 0, this.x[point_index] + rect_width, height);
      }
    }
    else if(this.x[point_index] + rect_width >= width){
      if(this.x[point_index] > 0){
        line(this.x[point_index], 0, this.x[point_index], height);
      }
    }  
  }
}





























































