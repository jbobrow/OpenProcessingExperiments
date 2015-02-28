
int dim = 600;
int center = (dim / 2) - 1;

void setup(){
  size(dim, dim);
  background(256);

  int[] list = genPrimeList(dim * dim);
  drawSpiral(list);
}
    
    
/*
 * generate prime number list
 * if result[n] == 0: then result[n] is prime
 */
int[] genPrimeList(int n){
  int[] result = new int[n + 1];
  
  for(int i = 2; i <= n; i++){
    for(int j = 2; i * j <= n; j++){
      result[i * j] = result[i * j] + 1;
    }
  }

  return result;
}

void drawSpiral(int[] list){
  int now_x = center;
  int now_y = center;
  
  int now_number = 1;
  
  int i;      
  for(int j = 0; j < sqrt(list.length) - 1; j = j + 2){

    // move j right
    for(i = 0; i < j; i++){
      now_x--;
      
      now_number++;   
      if(list[now_number] == 0){       
        point(now_x, now_y);
      }   
    }
  
    // move j up
    for(i = 0; i < j; i++){
      now_y++;
       
      now_number++;   
      if(list[now_number] == 0){       
        point(now_x, now_y);
      }   
    }
  
    // move j + 1 left
    for(i = 0; i < j + 1; i++){
      now_x++;
      
      now_number++;   
      if(list[now_number] == 0){       
        point(now_x, now_y);
      }   
    }
  
    // move j + 1 down
    for(i = 0; i < j + 1; i++){
      now_y--;
      
      now_number++;   
      if(list[now_number] == 0){       
        point(now_x, now_y);
      }             
    }  
  }
}
