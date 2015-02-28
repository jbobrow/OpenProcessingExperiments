
// importing the audio player library
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// contains the main page image
public PImage mainImage;
public Boolean isMainPage;

public final int colorIconNum = 5;
public ColorIcon[] colorIcons;
public PImage[] colorIconImgs;

public Stage stageToDisply;

public Boolean isFirstPage;
public Boolean isCorrectPage;
public Boolean isFirstWrongPage;
public Boolean isSecondTryPage;
public Boolean isGameOverPage;

public int firstWrongX1;
public int firstWrongY1;
public ColorIcon correctColorIcon;

public int previousIndex;
public int nextIndex;

public void setup() {
    size( 744, 400 );
    displayMainPage();
    initializeColorIcons();
    previousIndex = 1;
    Stage stageTemp = initializePlayingScene( previousIndex );
    stageToDisply = setCorrectColorToStage( stageTemp );
}

public void draw() {}

public void displayMainPage() {
    mainImage = loadImage( "data/start.png" );
    image( mainImage, 0, 0 );
    isMainPage = true;
}

public void initializeColorIcons() {
    colorIcons = new ColorIcon[ colorIconNum ];
    colorIcons[0] = new ColorIcon( "data/icons/white.png", 94, 330, 94, 330, 150, 384 );
    colorIcons[1] = new ColorIcon( "data/icons/yellow.png", 221, 330, 221, 330, 278, 384 );
    colorIcons[2] = new ColorIcon( "data/icons/orange.png", 345, 330, 345, 330, 401, 384 );
    colorIcons[3] = new ColorIcon( "data/icons/red.png", 475, 330, 475, 330, 527, 384 );
    colorIcons[4] = new ColorIcon( "data/icons/black.png", 595, 330, 595, 330, 653, 384 );
    colorIconImgs = new PImage[ colorIconNum ];
    for( int i = 0; i < colorIconNum; i++ )
    {
        colorIconImgs[i] = loadImage( colorIcons[i].getColorImgUrl() );
    }
}

public Stage initializePlayingScene( int sceneNumToDisplay ) {
    ArrayList<Scene> scenes = new ArrayList<Scene>();
    Scene firstPlayPage = new Scene( "/data/game/scene" + sceneNumToDisplay + ".png" );
    Scene correctPage = new Scene( "/data/game/correct" + sceneNumToDisplay + ".png" );
    Scene firstWrongPage = new Scene( "/data/game/wrong" + sceneNumToDisplay + ".png" );
    Scene secondTryPage = new Scene( "/data/game/scene" + sceneNumToDisplay + ".png" );
    Scene gameOverPage = new Scene( "/data/game/gameover" + sceneNumToDisplay + ".png" );
    scenes.add( firstPlayPage );
    scenes.add( correctPage );
    scenes.add( firstWrongPage );
    scenes.add( secondTryPage );
    scenes.add( gameOverPage );
    
    return new Stage( scenes );
}

public Stage setCorrectColorToStage( Stage stageIn ) {
    ArrayList<Scene> relatedScenes = stageIn.getScenes();
    Stage stageToReturn = new Stage( relatedScenes );
    String imgURL = relatedScenes.get(0).getBackgroundImageUrl();
    if( imgURL.equals( "/data/game/scene1.png" ) ){
        ColorIcon correctIcon = colorIcons[3];
        setColors( stageToReturn, correctIcon );
    } else if( imgURL.equals( "/data/game/scene2.png" ) ) {
        ColorIcon correctIcon = colorIcons[2];
        setColors( stageToReturn, correctIcon );
    } else if( imgURL.equals( "/data/game/scene3.png" ) ) {
        ColorIcon correctIcon = colorIcons[2];
        setColors( stageToReturn, correctIcon );
    } else if( imgURL.equals( "/data/game/scene4.png" ) ) {
        ColorIcon correctIcon = colorIcons[0];
        setColors( stageToReturn, correctIcon );
    } else if( imgURL.equals( "/data/game/scene5.png" ) ) {
        ColorIcon correctIcon = colorIcons[2];
        setColors( stageToReturn, correctIcon );
    }
     
    return stageToReturn;
}

public void setColors( Stage stageIn, ColorIcon correctCol ) {
    stageIn.setCorrectColor( correctCol );
    stageIn.setCorrectAnsX1( correctCol.getPosX1() );
    stageIn.setCorrectAnsY1( correctCol.getPosY1() );
    stageIn.setCorrectAnsX2( correctCol.getPosX2() );
    stageIn.setCorrectAnsY2( correctCol.getPosY2() );
}

public void clearPage() {
    fill(0);
    rect(0, 0, width, height);
}

public void displayMainBg( ArrayList<Scene> scenesIn, int index ) {
    PImage mainPg = loadImage( scenesIn.get( index ).getBackgroundImageUrl() );
    clearPage();
    image( mainPg, 0, 0 );
}

public void displayColorIconImgs() {
    for( int i = 0; i < colorIconNum; i++ )
    {
        image( colorIconImgs[i], colorIcons[i].getImgLocX1(), colorIcons[i].getImgLocY1() );
    }
}

public void displayFirstScene( Stage stageToDisplay ) {
    ArrayList<Scene> scenes = stageToDisplay.getScenes();
    displayMainBg( scenes, 0 );
    displayColorIconImgs();
    isMainPage = false;
    isFirstPage = true;
}

public void displayCorrectScene( Stage stageToDisplay ) {
    ArrayList<Scene> scenes = stageToDisplay.getScenes();
    displayMainBg( scenes, 1 );
    isFirstPage = false;
    isFirstWrongPage = false;
    isCorrectPage = true;
}

public void displayFirstWrongScene( Stage stageToDisplay, int x, int y ) {
    ArrayList<Scene> scenes = stageToDisplay.getScenes();
    displayMainBg( scenes, 2 );
    isFirstPage = false;
    isCorrectPage = false;
    isFirstWrongPage = true;
}

public void displaySecondTryScene( Stage stageToDisplay, int x, int y ) {
    ArrayList<Scene> scenes = stageToDisplay.getScenes();
    displayMainBg( scenes, 3 );
    displayColorIconImgs();
    displayWrongIcon( x, y );
    isFirstWrongPage = false;
    isSecondTryPage = true;
}

public void displayGameOverScene( Stage stageToDisplay ) {
    ArrayList<Scene> scenes = stageToDisplay.getScenes();
    displayMainBg( scenes, 4 );
    isSecondTryPage = false;
    isGameOverPage = true;
}

public void displayWrongIcon( int x, int y ) {
    PImage wrongIcon = loadImage( "/data/icons/wrongIcon.png" );
    image( wrongIcon, x, y );
}

public void mousePressed()
{
    if( mouseButton == LEFT ) 
    {
        if( isMainPage )
        {
            if( ( mouseX > 545 && mouseX < 707 )
              && ( mouseY > 351 && mouseY < 371 ) )
            {
                //move into tutorial page
                
                //for now display main page of first stage
                displayFirstScene( stageToDisply );
            }
            else
            {
                println( " Please Select Press Start " );
            }
        }
        else if( isFirstPage )
        {
            if( ( mouseX >= stageToDisply.getCorrectAnsX1() && mouseX <= stageToDisply.getCorrectAnsX2() )
                && ( mouseY >= stageToDisply.getCorrectAnsY1() && mouseY <= stageToDisply.getCorrectAnsY2() ) )
            {
                displayCorrectScene( stageToDisply );
            }
            else
            {
                if( isWhiteClicked() ) {
                    firstWrongX1 = 104;
                    firstWrongY1 = 340;
                    displayFirstWrongScene( stageToDisply, firstWrongX1, firstWrongY1 );
                } else if( isYellowClicked() ) {
                    firstWrongX1 = 231;
                    firstWrongY1 = 340;
                    displayFirstWrongScene( stageToDisply, firstWrongX1, firstWrongY1 );
                } else if( isOrangeClicked() ) {
                    firstWrongX1 = 355;
                    firstWrongY1 = 340;
                    displayFirstWrongScene( stageToDisply, firstWrongX1, firstWrongY1 );
                } else if( isRedClicked() ) {
                    firstWrongX1 = 485;
                    firstWrongY1 = 340;
                    displayFirstWrongScene( stageToDisply, firstWrongX1, firstWrongY1 );
                } else if( isBlackClicked() ) {
                    firstWrongX1 = 605;
                    firstWrongY1 = 340;
                    displayFirstWrongScene( stageToDisply, firstWrongX1, firstWrongY1 );
                }
            }
        }
        else if( isCorrectPage || isFirstWrongPage )
        {
            if( isCorrectPage && ( mouseX >= 645 && mouseX <= 720 )
                && ( mouseY >= 26 && mouseY <= 45 ) )
            {
                nextIndex = int( random( 1, 6 ) );
                if( nextIndex == previousIndex ) {
                    if( nextIndex == 6 ) {
                        nextIndex--;
                    } else {
                        nextIndex++;
                    }
                }
                Stage stageTemp = initializePlayingScene( nextIndex );
                stageToDisply = setCorrectColorToStage( stageTemp );
                displayFirstScene( stageToDisply );
                previousIndex = nextIndex;
                isCorrectPage = false;
            }
            else if( isFirstWrongPage
                     && ( ( mouseX >= 510 && mouseX <= 720 )
                        && ( mouseY >= 25 && mouseY <= 45 ) ) )
            {
                displaySecondTryScene( stageToDisply, firstWrongX1, firstWrongY1 );
            }
        }
        else if( isSecondTryPage )
        {
            if( ( mouseX >= stageToDisply.getCorrectAnsX1() && mouseX <= stageToDisply.getCorrectAnsX2() )
                && ( mouseY >= stageToDisply.getCorrectAnsY1() && mouseY <= stageToDisply.getCorrectAnsY2() ) )
            {
                displayCorrectScene( stageToDisply );
            }
            else
            {
                if( isWhiteClicked() ) {
                    displayGameOverScene( stageToDisply );
                } else if( isYellowClicked() ) {
                    displayGameOverScene( stageToDisply );
                } else if( isOrangeClicked() ) {
                    displayGameOverScene( stageToDisply );
                } else if( isRedClicked() ) {
                    displayGameOverScene( stageToDisply );
                } else if( isBlackClicked() ) {
                    displayGameOverScene( stageToDisply );
                }
            }
        }
        else if( isGameOverPage )
        {
            if( ( mouseX >= 657 && mouseX <= 719 )
                && ( mouseY >= 25 && mouseY <= 45 ) )
            {
                println( "Game Over" );
            }
        }
    }
}

public Boolean isWhiteClicked() { return ( ( mouseX >= 94 && mouseX <= 150  ) && ( mouseY >= 330 && mouseY <= 384) ); }
public Boolean isYellowClicked() { return ( ( mouseX >= 221 && mouseX <= 278  ) && ( mouseY >= 330 && mouseY <= 384) ); }
public Boolean isOrangeClicked() { return ( ( mouseX >= 345 && mouseX <= 401  ) && ( mouseY >= 330 && mouseY <= 384) ); }
public Boolean isRedClicked() { return ( ( mouseX >= 475 && mouseX <= 527  ) && ( mouseY >= 330 && mouseY <= 384) ); }
public Boolean isBlackClicked() { return ( ( mouseX >= 595 && mouseX <= 653  ) && ( mouseY >= 330 && mouseY <= 384) ); }
class ColorIcon
{
    public String colorImgUrl;
    public int imgLocX1;
    public int imgLocY1;
    public int posX1;
    public int posY1;
    public int posX2;
    public int posY2;
    
    public ColorIcon( String imgUrl, int _imgLocX1, int _imgLocY1, int _posX1, int _posY1, int _posX2, int _posY2 )
    {
        colorImgUrl = imgUrl;
        imgLocX1 = _imgLocX1;
        imgLocY1 = _imgLocY1;
        posX1 = _posX1;
        posY1 = _posY1;
        posX2 = _posX2;
        posY2 = _posY2;
    }
    
    public String getColorImgUrl() { return colorImgUrl; }
    
    public int getImgLocX1() { return imgLocX1; }
    public void setImgLocX1( int val ) { imgLocX1 = val; }
    
    public int getImgLocY1() { return imgLocY1; }
    public void setImgLocY1( int val ) { imgLocY1 = val; }
    
    public int getPosX1() { return posX1; }
    public void setPosX1( int val ) { posX1 = val; }
    
    public int getPosY1() { return posY1; }
    public void setPosY1( int val ) { posY1 = val; }
    
    public int getPosX2() { return posX2; }
    public void setPosX2( int val ) { posX2 = val; }
    
    public int getPosY2() { return posY2; }
    public void setPosY2( int val ) { posY2 = val; }
}
class Scene
{
    public String backgroundImageUrl;
    
    public Scene( String bgImgUrl  )
    {
        backgroundImageUrl = bgImgUrl;
    }
    
    public String getBackgroundImageUrl() { return backgroundImageUrl; }
    public void setBackgroundImageUrl( String val ) { backgroundImageUrl = val; }
}
class Stage
{
    public ArrayList<Scene> scenes;
    public ColorIcon correctColor;
    public int correctAnsX1;
    public int correctAnsY1;
    public int correctAnsX2;
    public int correctAnsY2;
    
    public Stage( ArrayList<Scene> scenesIn )
    {
        scenes = scenesIn;
    }

    public ArrayList<Scene> getScenes() { return scenes; }

    public ColorIcon getCorrectColor() { return correctColor; }
    public void setCorrectColor( ColorIcon val ) { correctColor = val; }
    
    public int getCorrectAnsX1() { return correctAnsX1; }
    public void setCorrectAnsX1( int val ) { correctAnsX1 = val; }
    
    public int getCorrectAnsY1() { return correctAnsY1; }
    public void setCorrectAnsY1( int val ) { correctAnsY1 = val; }
    
    public int getCorrectAnsX2() { return correctAnsX2; }
    public void setCorrectAnsX2( int val ) { correctAnsX2 = val; }
    
    public int getCorrectAnsY2() { return correctAnsY2; }
    public void setCorrectAnsY2( int val ) { correctAnsY2 = val; }
}


