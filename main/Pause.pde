
/*
  Class Pause
*/

class Pause extends State {
  
  /*
    coated - : l'état du jeu, avant la mise en pause
    paused - : l'affichage du jeu avant la mise en pause
    back --- : l'image du menu
    x, y --- : position du menu pause (en px)
  */
  
  State coated;
  Button[] buttons;
  PImage paused, back, hover;
  int x,y;

  Pause(State coated) {
    super("Pause");  
    this.coated = coated;
  }
  
  void load() {
    
    println("!> Enter in pause state");
    
    this.back = assets[24];
    this.hover = assets[25];
    this.paused = get(0,0, width,height);
    this.x = (width / 2) - (back.width / 2);
    this.y = (height / 2) - (back.height / 2);
    
    this.buttons = new Button[4];
    this.buttons[0] = new Button("Leave",   this.x + 177, this.y + 4,   14,  14);
    this.buttons[1] = new Button("Play",    this.x + 44,  this.y + 146, 107, 23);
    this.buttons[2] = new Button("Reset", this.x + 44,  this.y + 210, 107, 23);
    this.buttons[3] = new Button("Quit",    this.x + 44,  this.y + 274, 107, 23);
  
  }
  
  void update() {
    
    for (int i = 0; i < this.buttons.length; i ++ ) {
      
      if ( mousePressed && this.buttons[i].hover() ) {

        action(this.buttons[i].name);
      
      }
    
    }
    
  }
  
  void render() {
    
    background(this.paused);
    filter(GRAY);
    filter(BLUR, 2);
    image(this.back, this.x, this.y);
    
    for (int i = 0; i < this.buttons.length; i ++ ) {
    
      if ( this.buttons[i].hover() ) {
        image(this.hover, this.buttons[i].x, this.buttons[i].y, this.buttons[i].w, this.buttons[i].h);
      }
      
    }
    
  }
  
  void action(String name) {
    
    /* Appelle la fonction correspondant au bouton cliqué */
  
    if ( name.equals("Leave") || name.equals("Play") ) leave();
    
    else if ( name.equals("Reset") ) enterState( new Combat(this.coated.name) );
    
    else if ( name.equals("Quit") ) exit();
  
  }
  
  void keyDown(int k) {
  
    if (k == 27) {
      this.leave();
    }
    
  }
  
  void leave() {
  
    println("!> Leave pause state");
    actualState = this.coated;
  
  }

}
