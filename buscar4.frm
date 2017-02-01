VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form buscarpago 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "elBuscador de SISJACE"
   ClientHeight    =   2685
   ClientLeft      =   2730
   ClientTop       =   1785
   ClientWidth     =   5910
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form2"
   ScaleHeight     =   179
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   394
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin Jardin.xp_canvas forma 
      Height          =   2655
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   4683
      Caption         =   "elBuscador de SISJACE"
      Icon            =   "buscar4.frx":0000
      Fixed_Single    =   -1  'True
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   200
         Left            =   5400
         Top             =   1680
      End
      Begin Jardin.xphelp ayuda 
         Height          =   315
         Left            =   5175
         Top             =   75
         Width           =   315
         _ExtentX        =   556
         _ExtentY        =   556
      End
      Begin Jardin.xptopbuttons cerrar 
         Height          =   315
         Left            =   5505
         Top             =   75
         Width           =   315
         _ExtentX        =   556
         _ExtentY        =   556
      End
      Begin VB.TextBox termino 
         BackColor       =   &H00C5FAFE&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   270
         Left            =   240
         MaxLength       =   40
         TabIndex        =   1
         Top             =   2040
         Width           =   2415
      End
      Begin MSAdodcLib.Adodc bd 
         Height          =   330
         Left            =   1560
         Top             =   480
         Visible         =   0   'False
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   582
         ConnectMode     =   0
         CursorLocation  =   3
         IsolationLevel  =   -1
         ConnectionTimeout=   15
         CommandTimeout  =   30
         CursorType      =   3
         LockType        =   3
         CommandType     =   8
         CursorOptions   =   0
         CacheSize       =   50
         MaxRecords      =   0
         BOFAction       =   0
         EOFAction       =   0
         ConnectStringType=   1
         Appearance      =   1
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         Orientation     =   0
         Enabled         =   -1
         Connect         =   ""
         OLEDBString     =   ""
         OLEDBFile       =   ""
         DataSourceName  =   ""
         OtherAttributes =   ""
         UserName        =   ""
         Password        =   ""
         RecordSource    =   ""
         Caption         =   "Adodc1"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         _Version        =   393216
      End
      Begin VB.Image Image1 
         Height          =   915
         Left            =   240
         Picture         =   "buscar4.frx":0452
         Stretch         =   -1  'True
         Top             =   480
         Width           =   3615
      End
      Begin VB.Image Image2 
         Height          =   630
         Left            =   2880
         MouseIcon       =   "buscar4.frx":13C8
         MousePointer    =   99  'Custom
         Picture         =   "buscar4.frx":1526
         Stretch         =   -1  'True
         Top             =   1800
         Width           =   675
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Digite el No. de documento:"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   240
         TabIndex        =   2
         Top             =   1800
         Width           =   2400
      End
      Begin VB.Image Image5 
         Height          =   630
         Left            =   2880
         MouseIcon       =   "buscar4.frx":1AE7
         MousePointer    =   99  'Custom
         Picture         =   "buscar4.frx":1C45
         Stretch         =   -1  'True
         Top             =   1800
         Visible         =   0   'False
         Width           =   660
      End
      Begin VB.Image Image4 
         Height          =   630
         Left            =   2880
         MouseIcon       =   "buscar4.frx":2C21
         MousePointer    =   99  'Custom
         Picture         =   "buscar4.frx":2D7F
         Stretch         =   -1  'True
         Top             =   1800
         Visible         =   0   'False
         Width           =   660
      End
      Begin VB.Image Image3 
         Height          =   1845
         Left            =   3840
         Picture         =   "buscar4.frx":3DF1
         Stretch         =   -1  'True
         Top             =   480
         Width           =   1935
      End
   End
End
Attribute VB_Name = "buscarpago"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dato As String, Consulta_SQL As String

Private Sub ayuda_Click()
chmHelp.HelpFile = App.Path + "\jardin.chm"
chmHelp.DisplayTopic "buscar.htm"
End Sub

Private Sub cerrar_Click()
Unload Me
End Sub

Private Sub Form_Activate()
ConexionBD buscarpago, "select * from pagos"
termino.SetFocus
End Sub

Private Sub forma_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Image2.Visible = True
Image4.Visible = False
Image5.Visible = False
End Sub

Private Sub Image2_Click()
Dim campo As String
Dim enc As Integer
enc = 0

If termino.Text = "" Then
    MsgBox "No ha ingresado el n�mero del documento a buscar!", vbExclamation, "elBuscador"
    Exit Sub
End If
'consulta la bd
dato = termino.Text
Consulta_SQL = "SELECT * FROM pagos where numdoc='" & dato & "' and tipopago='Matricula'"
bd.RecordSource = Consulta_SQL
bd.Refresh

If bd.Recordset.RecordCount > 0 Then
    mostrarcampos
    enc = 1
    Me.Hide
End If

If enc = 0 Then
  MsgBox "No se encontraron coincidencias", vbInformation, "elBuscador"
  termino.SetFocus
End If
End Sub

Function mostrarcampos()
Pagos.numdoc.Text = bd.Recordset!numdoc
Pagos.pagmat.Text = bd.Recordset!tipopago
If bd.Recordset!otro <> Null Then
    Pagos.otro.Enabled = True
    Pagos.otro.Text = bd.Recordset!otro
End If
Pagos.valcon.Text = bd.Recordset!valcon
Pagos.feccon.Value = bd.Recordset!feccon
Pagos.numcon.Text = bd.Recordset!numcon
End Function

Private Sub Image2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Image2.Visible = False
Image4.Visible = True
End Sub

Private Sub Image4_Click()
Image4.Visible = False
Image5.Visible = True

End Sub

Private Sub Image4_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Timer1.Enabled = True
End Sub

Private Sub Image5_Click()
Image2_Click
End Sub

Private Sub termino_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
    Image2_Click
End If
End Sub

Private Sub Timer1_Timer()
Image5_Click
Timer1.Enabled = False
End Sub

Private Sub termino_GotFocus()
termino.SelStart = 0
termino.SelLength = Len(termino.Text)
End Sub

