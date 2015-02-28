
class Graph{
  
 int connections[][] = new int[number][number];
 Vertex vertices[] = new Vertex[number];
 
 Graph(){
  
 }
 void setup(){
   for( int i = 0; i < number; i++ ){
     this.vertices[i] = new Vertex();
     for( int j = i; j < number; j++ ){
       if( i != j && ( random(255) > 240 ) ){
         connections[i][j] = 1;

       }
       else{
         connections[i][j] = 0;
       }
     } 
   }

 }
 void display(){
   
   for( int i = 0; i < number; i++ ){
     for( int j = i; j < number; j++ ){
       if( connections[i][j] == 1 ){
         Vertex startVertex = vertices[i];
         Vertex endVertex = vertices[j];
         line( startVertex.getLocation().x, startVertex.getLocation().y, endVertex.getLocation().x, endVertex.getLocation().y );
         startVertex.springWith( endVertex );
        endVertex.springWith( startVertex );
       }
     }
   }
   for( int i = 0; i < number; i++ ){
     ellipse( vertices[i].getLocation().x, vertices[i].getLocation().y, 3, 3 );
     ellipse( vertices[i].getLocation().x, vertices[i].getLocation().y, 10, 10 );     
     vertices[i].update();
   }
   
   for( int i = 0; i < number; i++ ){
     for( int j = i+1; j < number; j++ ){
       if( vertices[i].getLocation().dist( vertices[j].getLocation() ) < 150 ){
         vertices[i].repel( vertices[j] );
         vertices[j].repel( vertices[i] );
       }
     }
   }
   
   
   
   
 }
  
}

