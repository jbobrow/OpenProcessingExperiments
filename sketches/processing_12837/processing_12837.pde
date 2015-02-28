
class Bike{
    
    int x;
    int y;
    color rgb;
    boolean crashed = false;
    
    Bike( int x, int y ){
        this.x = x;
        this.y = y;
    }
    
    public BoardTile getCurrentTile(){
        return game.getBoard().board[x][y];    
    }
    
    public boolean crashed(){
        return this.crashed;
    }
    
    void crash(){
        this.crashed = true;   
    }
    
    void setColor( color rgb ){
        this.rgb = rgb;
    }
    
    color getColor(){
        return this.rgb;
    }
    
    void goUp(){
        if( game.getBoard().board[x][y].up != null){
            move( game.getBoard().board[x][y].up );        
        }
        else{
            this.crash();
        }
    }
    
    void goDown(){        
        if( game.getBoard().board[x][y].down != null ){
            move( game.getBoard().board[x][y].down );        
        }
        else{
            this.crash();
        }
    }
    
    void goLeft(){
        if( game.getBoard().board[x][y].left != null ){
            move( game.getBoard().board[x][y].left );  
        }
        else{ 
            this.crash();
        }
    }
    
    void goRight(){
        if( game.getBoard().board[x][y].right != null ){
            move( game.getBoard().board[x][y].right ); 
        }
        else{
            this.crash();
        } 
    }
 
    void move( BoardTile to ){
            BoardTile from = game.getBoard().board[x][y];
            this.x = to.getX();
            this.y = to.getY();
            
            if( to.willCrash() ){
                this.crash();
                System.out.print("crashed");
            }
            else{            
                game.getBoard().moveBike( from, to );
            }
                
    }      
}

