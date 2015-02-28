
		int[] board = new int[9];
	int AImove;
	
	boolean mouseClick;
	boolean playerTurn = true;
	boolean end;
	boolean playerWin;
	boolean AIWin;
        boolean smart;

	 void setup(){
		size(300,300);
		background(255);
	//board array
		board[0]=0;
		board[1]=0;
		board[2]=0;
		board[3]=0;
		board[4]=0;
		board[5]=0;
		board[6]=0;
		board[7]=0;
		board[8]=0;
	}
	
	 void draw(){
		//draw board
			strokeWeight(5);
			stroke(0);
			line(width/3,0,width/3,height);
			line(2*width/3,0,2*width/3,height);
			line(0,height/3,width,height/3);
			line(0,2*height/3,width,2*height/3);
			
		//if game is not over
		if(end==false){
			if(playerTurn){
                        //player turn notification
                                //portname.write('g');
			//player move when mouse clicked
				player();
			//win tests
				playerTopTest();
				playerAcrossTest();
				playerBottomTest();
				playerLeftTest();
				playerDownTest();
				playerRightTest();
				playerFowardTest();
				playerBackwardTest();
			}
			else{
			//AI move
				AI();
			//win tests
				AITopTest();
				AIAcrossTest();
				AIBottomTest();
				AILeftTest();
				AIDownTest();
				AIRightTest();
				AIFowardTest();
				AIBackwardTest();
			}
		}
		else{
			//reset board after each game
			delay(1000);
			board[0]=0;
			board[1]=0;
			board[2]=0;
			board[3]=0;
			board[4]=0;
			board[5]=0;
			board[6]=0;
			board[7]=0;
			board[8]=0;
			background(255);
			end = false;
		}
		println("("+mouseX+","+mouseY+")"+mouseClick+","+board[0]+","+board[1]+","+board[2]+
													 ","+board[3]+","+board[4]+","+board[5]+
													 ","+board[6]+","+board[7]+","+board[8]);
                        filledTest();
		//reset mouse and serial port
			mouseClick = false;
	}
//player win conditions
	 void playerTopTest(){
		if(board[0]==1 && board[1]==1 && board[2]==1){
			stroke(0);
			strokeWeight(5);
			line(0,height/6,width,height/6);
			end = true;
		}
	}
	
	 void playerAcrossTest(){
		if(board[3]==1 && board[4]==1 && board[5]==1){
			stroke(0);
			strokeWeight(5);
			line(0,height/2,width,height/2);
			end = true;
		}
	}
	
	 void playerBottomTest(){
		if(board[6]==1 && board[7]==1 && board[8]==1){
			stroke(0);
			strokeWeight(5);
			line(0,5*height/6,width,5*height/6);
			end = true;
		}
	}
	
	 void playerLeftTest(){
		if(board[0]==1 && board[3]==1 && board[6]==1){
			stroke(0);
			strokeWeight(5);
			line(width/6,0,width/6,height);
			end = true;
		}
	}
	
	 void playerDownTest(){
		if(board[1]==1 && board[4]==1 && board[7]==1){
			stroke(0);
			strokeWeight(5);
			line(width/2,0,width/2,height);
			end = true;
		}
	}
	
	 void playerRightTest(){
		if(board[2]==1 && board[5]==1 && board[8]==1){
			stroke(0);
			strokeWeight(5);
			line(5*width/6,0,5*width/6,height);
			end = true;
		}
	}
	
	 void playerFowardTest(){
		if(board[2]==1 && board[4]==1 && board[6]==1){
			stroke(0);
			strokeWeight(5);
			line(0,height,width,0);
			end = true;
		}
	}
	
	 void playerBackwardTest(){
		if(board[0]==1 && board[4]==1 && board[8]==1){
			stroke(0);
			strokeWeight(5);
			line(0,0,width,height);
			end = true;
		}
	}
//AI win conditions
	 void AITopTest(){
		if(board[0]==2 && board[1]==2 && board[2]==2){
			stroke(0);
			strokeWeight(5);
			line(0,height/6,width,height/6);
			end = true;
		}
	}
	
	 void AIAcrossTest(){
		if(board[3]==2 && board[4]==2 && board[5]==2){
			stroke(0);
			strokeWeight(5);
			line(0,height/2,width,height/2);
			end = true;
		}
	}
	
	 void AIBottomTest(){
		if(board[6]==2 && board[7]==2 && board[8]==2){
			stroke(0);
			strokeWeight(5);
			line(0,5*height/6,width,5*height/6);
			end = true;
		}
	}
	
	 void AILeftTest(){
		if(board[0]==2 && board[3]==2 && board[6]==2){
			stroke(0);
			strokeWeight(5);
			line(width/6,0,width/6,height);
			end = true;
		}
	}
	
	 void AIDownTest(){
		if(board[1]==2 && board[4]==2 && board[7]==2){
			stroke(0);
			strokeWeight(5);
			line(width/2,0,width/2,height);
			end = true;
		}
	}
	
	 void AIRightTest(){
		if(board[2]==2 && board[5]==2 && board[8]==2){
			stroke(0);
			strokeWeight(5);
			line(5*width/6,0,5*width/6,height);
			end = true;
		}
	}
	
	 void AIFowardTest(){
		if(board[2]==2 && board[4]==2 && board[6]==2){
			stroke(0);
			strokeWeight(5);
			line(0,height,width,0);
			end = true;
		}
	}
	
	 void AIBackwardTest(){
		if(board[0]==2 && board[4]==2 && board[8]==2){
			stroke(0);
			strokeWeight(5);
			line(0,0,width,height);
			end = true;
		}
	}
//board filled conditions
	 void filledTest(){
		if( board[0]!=0 && board[1]!=0 && board[2]!=0 &&
			board[3]!=0 && board[4]!=0 && board[5]!=0 &&
			board[6]!=0 && board[7]!=0 && board[8]!=0){
			delay(1000);
			end = true;
		}
	}
//mouse controls
	 void player(){
		if(mouseClick){
			//make sure mouse is in window and over empty space
			//if not, does nothing
			if(0<mouseX && mouseX<width && 0<mouseY && mouseY<height && board[(3*mouseX/width)+3*round(3*mouseY/height)] == 0){
				//record player's move in array
					board[(3*mouseX/width)+3*round(3*mouseY/height)] = 1;
				//draw X
					line(width/3*round(3*mouseX/width)+10,height/3*round(3*mouseY/height)+10,width/3*round(3*mouseX/width)+90,height/3*round(3*mouseY/height)+90);
					line(width/3*round(3*mouseX/width)+90,height/3*round(3*mouseY/height)+10,width/3*round(3*mouseX/width)+10,height/3*round(3*mouseY/height)+90);
				//player turn over
					playerTurn = false;
			}
		}
	}
//fair (although not so smart) AI.  Randomly chooses an empty space
	 void AI(){
           smart=false;
           space0win();
           space1win();
           space2win();
           space3win();
           space4win();
           space5win();
           space6win();
           space7win();
           space8win();
           space0block();
           space1block();
           space2block();
           space3block();
           space4block();
           space5block();
           space6block();
           space7block();
           space8block();
	   if(smart==false && playerTurn == false){
             AImove = (int) random(9);
		if(board[AImove] == 0){
		  board[AImove] = 2;
		  ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		  delay(500);
		  playerTurn = true;
		}
		else{
		  AImove = (int) random(9);
		}
           }
	}
	//sets mouseClicked to true
	 void mouseClicked(){
		mouseClick = true;
	}
void space0win(){
  if((board[0] == 0) && playerTurn == false &&(
               (board[1] == 2 && board[2] == 2)||
               (board[4] == 2 && board[8] == 2)||
               (board[3] == 2 && board[6] == 2))){
                AImove=0;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space2win(){
  if((board[2] == 0) && playerTurn == false &&(
               (board[0] == 2 && board[1] == 2)||
               (board[4] == 2 && board[6] == 2)||
               (board[5] == 2 && board[8] == 2))){
                AImove=2;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space6win(){
  if((board[6] == 0) && playerTurn == false &&(
               (board[0] == 2 && board[3] == 2)||
               (board[2] == 2 && board[4] == 2)||
               (board[7] == 2 && board[8] == 2))){
                AImove=6;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space8win(){
  if((board[8] == 0) && playerTurn == false &&(
               (board[0] == 2 && board[4] == 2)||
               (board[2] == 2 && board[5] == 2)||
               (board[6] == 2 && board[7] == 2))){
                AImove=8;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space1win(){
  if((board[1] == 0 && playerTurn == false) && (
               (board[0] == 2 && board[2] == 2)||
               (board[4] == 2 && board[7] == 2))){
                AImove=1;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space3win(){
  if((board[3] == 0 && playerTurn == false) && (
               (board[0] == 2 && board[6] == 2)||
               (board[4] == 2 && board[5] == 2))){
                AImove=3;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space5win(){
  if((board[5] == 0 && playerTurn == false) && (
               (board[3] == 2 && board[4] == 2)||
               (board[2] == 2 && board[8] == 2))){
                AImove=5;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space7win(){
  if((board[7] == 0 && playerTurn == false) && (
               (board[1] == 2 && board[4] == 2)||
               (board[6] == 2 && board[8] == 2))){
                AImove=7;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space4win(){
  if((board[4] == 0 && playerTurn == false) && (
               (board[0] == 2 && board[8] == 2)||
               (board[1] == 2 && board[7] == 2)||
               (board[2] == 2 && board[6] == 2)||
               (board[3] == 2 && board[5] == 2))){
                AImove=4;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space0block(){
  if((board[0] == 0) && playerTurn == false &&(
               (board[1] == 1 && board[2] == 1)||
               (board[4] == 1 && board[8] == 1)||
               (board[3] == 1 && board[6] == 1))){
                AImove=0;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space2block(){
  if((board[2] == 0) && playerTurn == false &&(
               (board[0] == 1 && board[1] == 1)||
               (board[4] == 1 && board[6] == 1)||
               (board[5] == 1 && board[8] == 1))){
                AImove=2;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space6block(){
  if((board[6] == 0) && playerTurn == false &&(
               (board[0] == 1 && board[3] == 1)||
               (board[2] == 1 && board[4] == 1)||
               (board[7] == 1 && board[8] == 1))){
                AImove=6;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space8block(){
  if((board[8] == 0) && playerTurn == false &&(
               (board[0] == 1 && board[4] == 1)||
               (board[2] == 1 && board[5] == 1)||
               (board[6] == 1 && board[7] == 1))){
                AImove=8;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space1block(){
  if((board[1] == 0 && playerTurn == false) && (
               (board[0] == 1 && board[2] == 1)||
               (board[4] == 1 && board[7] == 1))){
                AImove=1;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space3block(){
  if((board[3] == 0 && playerTurn == false) && (
               (board[0] == 1 && board[6] == 1)||
               (board[4] == 1 && board[5] == 1))){
                AImove=3;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space5block(){
  if((board[5] == 0 && playerTurn == false) && (
               (board[3] == 1 && board[4] == 1)||
               (board[2] == 1 && board[8] == 1))){
                AImove=5;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space7block(){
  if((board[7] == 0 && playerTurn == false) && (
               (board[1] == 1 && board[4] == 1)||
               (board[6] == 1 && board[8] == 1))){
                AImove=7;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

void space4block(){
  if((board[4] == 0 && playerTurn == false) && (
               (board[0] == 1 && board[8] == 1)||
               (board[1] == 1 && board[7] == 1)||
               (board[2] == 1 && board[6] == 1)||
               (board[3] == 1 && board[5] == 1))){
                AImove=4;
	        board[AImove] = 2;
	        ellipse(width/3*((AImove)%3)+50,(height/3)*((AImove)/3)+50,80,80);
		delay(500);
		playerTurn = true;
                smart=true;
	   }
}

