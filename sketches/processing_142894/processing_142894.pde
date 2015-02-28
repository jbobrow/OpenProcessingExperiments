
final int MAX_FIGURES = 10; 
 
Figure [ ] allFigures; 
 
void setup ( ) 
{ 
 size( 400, 400 ); 
 allFigures = initFigures( ); 
} 
 
void draw( ) 
{ 
 background( 0 ); 
 moveFigures( ); 
 drawFigures( ); 
} 
 
Figure [ ] initFigures( ) 
{ 
 Figure [ ] temp = new Figure[ MAX_FIGURES ] ; 
 
 for ( int i = 0; i < temp.length; i++) 
 { 
 int x = int( random( width ) ); 
 int y = int( random( height ) ); 
 int dim = int( random( 50 ) ); 
 int col = color( random( 255 ),random( 255 ), random( 255 ) ); 
 temp[i] = new Figure( x, y, dim, col ); 
 } 
 
 return temp; 
} 


void moveFigures(){
  for(int i=0;i<MAX_FIGURES;i++){
    allFigures[i].moveFigure();
  }   
}

void drawFigures(){
  for(int i=0;i<MAX_FIGURES;i++){
    allFigures[i].drawFigure();
  } 
}

//risa hiyama 


class Figure
{
  
  int x,y,dim;
color col;

  //constructer
  Figure( int tx, int ty, int tdim, color tcol ) 
  { 
    x = tx; 
    y = ty; 
    dim = tdim; 
    col = tcol; 
  } 
  
  void drawFigure(){
    fill (col);
    rect(x,y,dim,dim);
  }
  
  void moveFigure(){
    if(x<width){
      
    x=x+1;
    
    }
    if(x==width){
    x=0;
    
    }
    
  }

}


  



