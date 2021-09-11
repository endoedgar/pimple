; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

; Comandos de inteligência artificial ;
;        "Comandos impossíveis"       ;
;                Começo               ;
[Command]
name = "AI"
command = x, x, x
time = 1

[Command]
name = "AI"
command = x, y, y
time = 1

[Command]
name = "AI"
command = x, y, z
time = 1

[Command]
name = "AI"
command = x, z, z
time = 1

[Command]
name = "AI"
command = y, y, y
time = 1

[Command]
name = "AI"
command = y, x, x
time = 1

[Command]
name = "AI"
command = y, x, z
time = 1

[Command]
name = "AI"
command = y, z, z
time = 1

[Command]
name = "AI"
command = z, z, z
time = 1

[Command]
name = "AI"
command = z, x, x
time = 1

[Command]
name = "AI"
command = z, x, y
time = 1

; Comandos de inteligência artificial ;
;              Fim                    ;

;-| Super Motions |--------------------------------------------------------
[Command]
name = "Charge"
command = /a+b
time = 1

[Command]
name = "Combo1"
command = ~D,DF,F,x
time = 30
;-| Special Motions |------------------------------------------------------

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------

[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

[State -1, Ativar IA]
type = VarSet
triggerall = command = "AI"
trigger1 = RoundState = 2
trigger1 = var(59) != 1
v = 59
value = 1

[State -1, Pular IA]
type = ChangeState
value = 40
triggerall = var(59) && !IsHelper && stateno != 40 && statetype != A && Alive && ctrl && roundstate = 2 && random <= 100
trigger1 = enemynear, Pos Y < Pos Y - Const(size.height)

; Combo
[State -1, Combo]
type = ChangeState
value = 3100
trigger1 = abs(Enemynear, Pos X - Pos X) <= 50
triggerall = ctrl && power >= 2000
triggerall = var(59) && alive && roundstate = 2 && !IsHelper
triggerall = statetype = S

[State -1, Combo1]
type = Varset
trigger1 = 1
var(2) = 0

[State -1, Combo2]
type = Varset
trigger1 = stateno = 200 && animelemtime(3) > 0
trigger2 = stateno = 210 && animelemtime(3) > 0
trigger3 = stateno = 220 && animelemtime(2) > 0
trigger3 = stateno = 2000 && AnimElem = 103
ignorehitpause = 1
var(2) = var(2) | 1

[State -1, Combo3]
type = Varset
trigger1 = stateno = 2000 && AnimElem = 58
ignorehitpause = 1
var(2) = var(2) | 2

[State -1, Combo4]
type = Varset
trigger1 = stateno = ifelse(power >= 1000,3001,220) && AnimElemTime(2) > 3
ignorehitpause = 1
var(2) = var(2) | 3

; Inteligência Artificial ;
;         Começo          ;

[State -1, Agarrar IA]
type = ChangeState
value = ifelse(random<500,800,200)
triggerall = var(59)
triggerall = Alive
triggerall = ctrl
triggerall = stateno != 800
triggerall = statetype = S
triggerall = stateno != 100
triggerall = roundstate = 2
trigger1 = p2bodydist X < 20
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger1 = random <= 800
trigger2 = stateno = 210
trigger2 = moveguarded
trigger2 = var(2) = 1

[State -1, Chutar IA]
type = ChangeState
value = ifelse(power >= 1000,3001,220)
triggerall = var(59)
triggerall = Alive && statetype != A
triggerall = stateno != ifelse(power >= 1000,3001,220)
triggerall = roundstate = 2
trigger1 = ctrl
trigger1 = prevstateno = 820
trigger2 = movecontact
trigger2 = var(2) = 2
trigger3 = P2BodyDist X <= 15
trigger3 = ctrl
trigger4 = power >= 1000
trigger4 = movecontact && ctrl

;---------------------------------------------------------------------------
;Stand Punch 1
[State -1, Soco 1 IA]
type = ChangeState
value = ifelse(power >= 1000,ifelse(statetype = A, 3003,2000), ifelse(statetype = A, 600,200))
triggerall = var(59)
triggerall = RoundState = 2
triggerall = Alive
triggerall = ctrl
triggerall = stateno != 100
triggerall = stateno != ifelse(power >= 1000,2000,200)
triggerall = enemynear, pos y >= Const(size.head.pos.y)
trigger1 = enemynear, Alive
trigger1 = prevstateno != 210
trigger1 = stateno != 220
trigger1 = facing = 1
trigger1 = (abs(enemynear, Pos X - Pos X) < 15 && statetype = S) || (abs(enemynear, Pos X - Pos X) <= 40 && statetype = A)
trigger2 = movecontact && ctrl && random < 200

;---------------------------------------------------------------------------
; Stand Punch 2
[State -1, Soco 2 IA]
type = ChangeState
value = 210
triggerall = var(59)
triggerall = Alive
triggerall = stateno != 220
triggerall = stateno != 100
triggerall = statetype = S
triggerall = stateno != 210
triggerall = movecontact
triggerall = roundstate = 2
trigger1 = var(2) = 1


;---------------------------------------------------------------------------
; Stand Kick or Super Marret
[State -1, ComboFinal IA]
type = ChangeState
value = ifelse(random < 800,200,ifelse(power >= 1000,ifelse(random < 500,3001,3002),220))
triggerall = var(59)
triggerall = Alive
triggerall = statetype = S
triggerall = movecontact
triggerall = !moveguarded
triggerall = roundstate = 2
trigger1 = stateno != 100
trigger1 = stateno = 210
trigger1 = var(2) = 1

[State -1, Defesa IA]
type = ChangeState
triggerall = var(59)
triggerall = Alive
triggerall = ctrl
triggerall = enemynear, MoveType = A
triggerall = roundstate = 2
trigger1 = enemynear, pos x <= pos x + 35 && enemynear, pos x >= pos x
trigger1 = stateno != 120
trigger2 = enemynear, numproj > 0
trigger3 = enemynear, MoveType = A
value = 120

;------------------------------------
; Cabeçada (Forte e fraca)
[State -1, Cabecada IA]
type = ChangeState
value = ifelse(power >= 1000 && P2BodyDist X < 30,3000,1000)
triggerall = var(59)
triggerall = Alive
triggerall = stateno != ifelse(power >= 1000,3000,1000)
triggerall = prevstateno != ifelse(power >= 1000,3000,1000)
triggerall = roundstate = 2
trigger1 = ctrl
trigger1 = stateno = 0
trigger1 = enemynear, stateno != 5110
trigger1 = abs(enemynear, Pos X - Pos X) > 60
trigger2 = movecontact && ctrl && random < 200

;------------------------------------
; Recuperar
[State -1, Recuperar IA]
type = ChangeState
triggerall = var(59)
triggerall = Alive
triggerall = CanRecover && Vel Y > -1
triggerall = roundstate = 2
triggerall = statetype = A
trigger1 = StateNo = 5050
persistent = 0
value = 5210

;------------------------------------
; Provocar na hora certa
[State -1, Provocar IA]
type = ChangeState
triggerall = var(59)
triggerall = Alive
triggerall = Statetype = S
triggerall = ctrl
triggerall = stateno != 195
triggerall = roundstate = 2
trigger1 = enemynear, stateno = 5110
value = 195

;--------------------------------
; Depois de arremessar, sair de perto
[State -1, Sair de perto IA]
type = ChangeState
triggerall = var(59)
triggerall = Alive
;triggerall = ctrl
trigger1 = stateno = 821
trigger1 = AnimTime = 0
trigger1 = stateno != 105
value = 105

;------------------------------------
; Contra-ataque
[State -1, Contra-ataque IA]
type = ChangeState
triggerall = var(59) && roundstate = 2
triggerall = Alive && enemynear, movetype != A
trigger1 = stateno = 130
value = 200

;-------------------------------------
; Charge
[State -1, Charge IA]
type = ChangeState
value = 704
triggerall = var(59) && roundstate = 2
triggerall = Alive
triggerall = life > 0
triggerall = power < PowerMax
triggerall = statetype = S
trigger1 = enemynear, movetype != A
trigger1 = enemynear, P2BodyDist X > 110
trigger1 = ctrl
trigger1 = stateno != 704 && stateno != 705 && prevstateno != 704 && prevstateno != 705
var(12) = 1

[State -1, var(12)]
type = Varset
trigger1 = stateno != 704
v = 12
value = 0

; Inteligência Artificial ;
;           Fim           ;

;------------------------------------
; Combo
[State -1, Combo]
type = ChangeState
value = 3100
trigger1 = command = "Combo1"
triggerall = ctrl && power >= 2000
triggerall = !var(59) && alive
triggerall = statetype = S

;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
; Taunt
[State -1, Provocar]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl


;---------------------------------------------------------------------------
;Stand Punch 1
[State -1, Soco 1]
type = ChangeState
value = 200
triggerall = stateno != 220
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = stateno != 100
triggerall = statetype = S
triggerall = stateno != 200
triggerall = prevstateno != 210
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Punch 2
[State -1, Soco 2]
type = ChangeState
value = 210
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = stateno != 220
triggerall = stateno != 100
triggerall = statetype = S
triggerall = stateno != 210
triggerall = movecontact
trigger1 = var(2) = 1

;---------------------------------------------------------------------------
; Stand Kick or Super Marret
[State -1, ComboFinal]
type = ChangeState
value = ifelse(random < 800,200,ifelse(power >= 1000,ifelse(random < 500,3001,ifelse(random < 600, 2000, 3002)),220))
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = stateno != 100
trigger1 = stateno = 210
trigger1 = statetype = S
trigger1 = movecontact
trigger1 = !moveguarded
trigger1 = var(2) = 1

;---------------------------------------------------------------------------
; Pulo - Soco ou Pulo - Cacetada
[State -1, Pulo - Soco]
type = ChangeState
value = ifelse(power >= 1000,3003,600)
triggerall = command = "x"
triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Agarrar]
type = ChangeState
value = 800
triggerall = command = "z"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
triggerall = p2bodydist X < 20
triggerall = (p2statetype = S) || (p2statetype = C)
triggerall = p2movetype != H
trigger1 = pos x < enemynear, pos x
trigger1 = Facing = 1
trigger2 = pos x > enemynear, pos x
trigger2 = Facing = -1

;---------------------------------------------------------------------------
; Pulo - Soco ou Pulo - Cacetada
;[State -1, Agarrar]
;type = ChangeState
;value = 800
;triggerall = command = "x"
;trigger1 = statetype = S
;trigger1 = enemynear, P2BodyDist X < 20
;trigger1 = ctrl

;------------------------------------
; Cabeçada (Forte e fraca)
[State -1, Cabecada]
type = ChangeState
value = ifelse(power >= 1000,3000,1000)
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = ctrl
triggerall = enemynear, stateno != 5110
trigger1 = stateno = 100

;------------------------------------
; Chutar inimigo
[State -1, Chute]
type = ChangeState
value = ifelse(power >= 1000,3001,220)
trigger1 = command = "x"
triggerall = command != "holddown"
triggerall = ctrl
triggerall = !var(59)
triggerall = statetype = S
trigger1 = enemynear, stateno = 5110
trigger1 = P2BodyDist X <= 45
trigger1 = stateno = 100
trigger2 = command = "y"

;-------------------------------------
; Charge
[State -1, Charge]
type = ChangeState
value = 704
triggerall = command = "Charge"
triggerall = life > 0 && statetype != A
triggerall = power < PowerMax && !var(59)
trigger1 = ctrl
