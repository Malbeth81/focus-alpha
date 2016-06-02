object frmMain: TfrmMain
  Left = 225
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FocusAlpha'
  ClientHeight = 282
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseUp = FormMouseUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnApply: TButton
    Left = 248
    Top = 248
    Width = 73
    Height = 25
    Caption = 'Apply'
    TabOrder = 3
    OnClick = btnApplyClick
  end
  object btnTerminate: TButton
    Left = 8
    Top = 248
    Width = 145
    Height = 25
    Caption = 'Exit FocusAlpha'
    TabOrder = 1
    OnClick = btnTerminateClick
  end
  object btnOk: TButton
    Left = 168
    Top = 248
    Width = 73
    Height = 25
    Cancel = True
    Caption = 'Ok'
    Default = True
    TabOrder = 2
    OnClick = btnOkClick
  end
  object pgcSettings: TPageControl
    Left = 8
    Top = 8
    Width = 313
    Height = 233
    ActivePage = tbsExclusions
    TabIndex = 1
    TabOrder = 0
    TabWidth = 120
    object tbsGeneral: TTabSheet
      Caption = 'General'
      object lblName: TLabel
        Left = 44
        Top = 4
        Width = 113
        Height = 24
        Caption = 'FocusAlpha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object imgIcon: TImage
        Left = 8
        Top = 8
        Width = 32
        Height = 32
        Picture.Data = {
          055449636F6E0000010003001010000001000800680500003600000020200000
          01000800A80800009E0500003030000001000800A80E0000460E000028000000
          1000000020000000010008000000000040010000000000000000000000010000
          0000000000000000800080008000000080800000008000000080800000008000
          C0C0C000C0DCC000F0CAA60080808000FF00FF00FF000000FFFF000000FF0000
          00FFFF000000FF00FFFFFF00F0FBFF00A4A0A000D4F0FF00B1E2FF008ED4FF00
          6BC6FF0048B8FF0025AAFF0000AAFF000092DC00007AB90000629600004A7300
          00325000D4E3FF00B1C7FF008EABFF006B8FFF004873FF002557FF000055FF00
          0049DC00003DB900003196000025730000195000D4D4FF00B1B1FF008E8EFF00
          6B6BFF004848FF002525FF000000FF000000DC000000B9000000960000007300
          00005000E3D4FF00C7B1FF00AB8EFF008F6BFF007348FF005725FF005500FF00
          4900DC003D00B900310096002500730019005000F0D4FF00E2B1FF00D48EFF00
          C66BFF00B848FF00AA25FF00AA00FF009200DC007A00B900620096004A007300
          32005000FFD4FF00FFB1FF00FF8EFF00FF6BFF00FF48FF00FF25FF00FF00FF00
          DC00DC00B900B900960096007300730050005000FFD4F000FFB1E200FF8ED400
          FF6BC600FF48B800FF25AA00FF00AA00DC009200B9007A009600620073004A00
          50003200FFD4E300FFB1C700FF8EAB00FF6B8F00FF487300FF255700FF005500
          DC004900B9003D00960031007300250050001900FFD4D400FFB1B100FF8E8E00
          FF6B6B00FF484800FF252500FF000000DC000000B90000009600000073000000
          50000000FFE3D400FFC7B100FFAB8E00FF8F6B00FF734800FF572500FF550000
          DC490000B93D0000963100007325000050190000FFF0D400FFE2B100FFD48E00
          FFC66B00FFB84800FFAA2500FFAA0000DC920000B97A000096620000734A0000
          50320000FFFFD400FFFFB100FFFF8E00FFFF6B00FFFF4800FFFF2500FFFF0000
          DCDC0000B9B90000969600007373000050500000F0FFD400E2FFB100D4FF8E00
          C6FF6B00B8FF4800AAFF2500AAFF000092DC00007AB90000629600004A730000
          32500000E3FFD400C7FFB100ABFF8E008FFF6B0073FF480057FF250055FF0000
          49DC00003DB90000319600002573000019500000D4FFD400B1FFB1008EFF8E00
          6BFF6B0048FF480025FF250000FF000000DC000000B900000096000000730000
          00500000D4FFE300B1FFC7008EFFAB006BFF8F0048FF730025FF570000FF5500
          00DC490000B93D00009631000073250000501900D4FFF000B1FFE2008EFFD400
          6BFFC60048FFB80025FFAA0000FFAA0000DC920000B97A000096620000734A00
          00503200D4FFFF00B1FFFF008EFFFF006BFFFF0048FFFF0025FFFF0000FFFF00
          00DCDC0000B9B900009696000073730000505000F2F2F200E6E6E600DADADA00
          CECECE00C2C2C200B6B6B600AAAAAA009E9E9E0092929200868686007A7A7A00
          6E6E6E0062626200565656004A4A4A003E3E3E0032323200262626001A1A1A00
          0E0E0E0000F80A0A0A0A0AF60A0A0A0A0A0A0A0AF4838383838383F583838383
          8383760A83EFF0F0F0F0EF09F0EFF0F0F0EE830A0A1111111111111111111111
          1111830A0A111111F9F80AF1111111111111830A0A111111F2F0F5F8F3111111
          1111830A0A111111F3EFF6FAFE1111111111830A0A111111F3F2F5FAF8FA1111
          1111830A0A11111111F8FC0713F7FA111111830A0A1111111111EFF9EFF3FAAE
          1111830A0A11111111111111FBEFC0B9AE11830AF51111111111111111FBC9C0
          04AE760A88898989898989898989FBC9C004AEF69393939393939393939386FB
          C9C004AE000000000000000000000000FBBDC004000000000000000000000000
          0013F4F48000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
          0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFFF0FFFF
          FFF8FFFF28000000200000004000000001000800000000008004000000000000
          0000000000010000000000000000000080008000800000008080000000800000
          0080800000008000C0C0C000C0DCC000F0CAA60080808000FF00FF00FF000000
          FFFF000000FF000000FFFF000000FF00FFFFFF00F0FBFF00A4A0A000D4F0FF00
          B1E2FF008ED4FF006BC6FF0048B8FF0025AAFF0000AAFF000092DC00007AB900
          00629600004A730000325000D4E3FF00B1C7FF008EABFF006B8FFF004873FF00
          2557FF000055FF000049DC00003DB900003196000025730000195000D4D4FF00
          B1B1FF008E8EFF006B6BFF004848FF002525FF000000FF000000DC000000B900
          000096000000730000005000E3D4FF00C7B1FF00AB8EFF008F6BFF007348FF00
          5725FF005500FF004900DC003D00B900310096002500730019005000F0D4FF00
          E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00FF009200DC007A00B900
          620096004A00730032005000FFD4FF00FFB1FF00FF8EFF00FF6BFF00FF48FF00
          FF25FF00FF00FF00DC00DC00B900B900960096007300730050005000FFD4F000
          FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00AA00DC009200B9007A00
          9600620073004A0050003200FFD4E300FFB1C700FF8EAB00FF6B8F00FF487300
          FF255700FF005500DC004900B9003D00960031007300250050001900FFD4D400
          FFB1B100FF8E8E00FF6B6B00FF484800FF252500FF000000DC000000B9000000
          960000007300000050000000FFE3D400FFC7B100FFAB8E00FF8F6B00FF734800
          FF572500FF550000DC490000B93D0000963100007325000050190000FFF0D400
          FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA0000DC920000B97A0000
          96620000734A000050320000FFFFD400FFFFB100FFFF8E00FFFF6B00FFFF4800
          FFFF2500FFFF0000DCDC0000B9B90000969600007373000050500000F0FFD400
          E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC00007AB90000
          629600004A73000032500000E3FFD400C7FFB100ABFF8E008FFF6B0073FF4800
          57FF250055FF000049DC00003DB90000319600002573000019500000D4FFD400
          B1FFB1008EFF8E006BFF6B0048FF480025FF250000FF000000DC000000B90000
          009600000073000000500000D4FFE300B1FFC7008EFFAB006BFF8F0048FF7300
          25FF570000FF550000DC490000B93D00009631000073250000501900D4FFF000
          B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FFAA0000DC920000B97A00
          0096620000734A0000503200D4FFFF00B1FFFF008EFFFF006BFFFF0048FFFF00
          25FFFF0000FFFF0000DCDC0000B9B900009696000073730000505000F2F2F200
          E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAAAA009E9E9E0092929200
          868686007A7A7A006E6E6E0062626200565656004A4A4A003E3E3E0032323200
          262626001A1A1A000E0E0E0000F5F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F2958A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A
          8A8A8A8A8A8A8A8A8A89FDF49483838383838383838383838383838383838383
          83838383838383838384FDF40A11111111111111111111111111111111111111
          11111111111111111109FDF40A11111111111111111111111111111111111111
          11111111111111111109FDF48411111111111111111111111111111111111111
          11111111111111111109FDF48411111111111111111111111111111111111111
          11111111111111111109FDF48411111111111111111111111111111111111111
          11111111111111111109FDF48411111111111111111111111111111111111111
          11111111111111111109FDF4841111111111111111F7F8F8F80A11EC11111111
          11111111111111111109FDF4841111111111111111F3F407F4F4F8FA07111111
          11111111111111111109FDF484111111111111111111F807F10AF5F5F9071111
          11111111111111111109FDF4841111111111111111EC1EF0EFF5F7F7F6F90711
          11111111111111111109FDF4841111111111111111ECF8F2EC0AF8F9F8FAF311
          11111111111111111109FDF4831111111111111111ECEAF1EDF6FAFAFCFFFB11
          11111111111111111109FDF4841111111111111111ECF7F4EEF4FBFBFBF8F9FB
          11111111111111111109FDF4831111111111111111ECEB0AF4F1F9F6F1F3F8FB
          FD111111111111111109FDF484111111111111111111EEF8F8F7FBF211F6F6F5
          F9FC1111111111111109FDF48411111111111111111111EEF7FCFE0AF3F007F6
          F8FBFB11111111111109FDF4841111111111111111111111EDEEEDFCF9EE07F4
          0AF9BAFB111111111109FDF484111111111111111111111111111111FE0A1308
          F6D1B9BAFB1111111109FDF493EEEEEFEEEEEEEEEEEEEEEEEEEEEEEEEEFEF7F6
          CBC0D0B9BAFBEEEEEE8FFCF4949595959595959595959595959595959595FBBE
          BCBEC0D0B9BAFB888894FCF494948888889488889494948888888888888894FB
          BEC9BEC0D1B9BAFBF893FCF29493939393919391919391939393939393939393
          FBBEBCBEC0D0B9BAFB91FA008F93939393939393939393939393939393939393
          93FBBEBCBEC0D0B9BAFB00000000000000000000000000000000000000000000
          0000FBBEC9BEC0D0B9BAFB000000000000000000000000000000000000000000
          000000FBBE08BEC0D0B9BAFB0000000000000000000000000000000000000000
          00000000FBBEBCBEC0D0BAF60000000000000000000000000000000000000000
          0000000000FBBEBCBEC0D1F60000000000000000000000000000000000000000
          000000000000FBBE08BEB9F60000000000000000000000000000000000000000
          00000000000000F6F6F7F6008000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000100000003FFFFFC01FFFFFE00FFFFFF00
          FFFFFF80FFFFFFC0FFFFFFE12800000030000000600000000100080000000000
          800A000000000000000000000001000000000000000000008000800080000000
          80800000008000000080800000008000C0C0C000C0DCC000F0CAA60080808000
          FF00FF00FF000000FFFF000000FF000000FFFF000000FF00FFFFFF00F0FBFF00
          A4A0A000D4F0FF00B1E2FF008ED4FF006BC6FF0048B8FF0025AAFF0000AAFF00
          0092DC00007AB90000629600004A730000325000D4E3FF00B1C7FF008EABFF00
          6B8FFF004873FF002557FF000055FF000049DC00003DB9000031960000257300
          00195000D4D4FF00B1B1FF008E8EFF006B6BFF004848FF002525FF000000FF00
          0000DC000000B900000096000000730000005000E3D4FF00C7B1FF00AB8EFF00
          8F6BFF007348FF005725FF005500FF004900DC003D00B9003100960025007300
          19005000F0D4FF00E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00FF00
          9200DC007A00B900620096004A00730032005000FFD4FF00FFB1FF00FF8EFF00
          FF6BFF00FF48FF00FF25FF00FF00FF00DC00DC00B900B9009600960073007300
          50005000FFD4F000FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00AA00
          DC009200B9007A009600620073004A0050003200FFD4E300FFB1C700FF8EAB00
          FF6B8F00FF487300FF255700FF005500DC004900B9003D009600310073002500
          50001900FFD4D400FFB1B100FF8E8E00FF6B6B00FF484800FF252500FF000000
          DC000000B9000000960000007300000050000000FFE3D400FFC7B100FFAB8E00
          FF8F6B00FF734800FF572500FF550000DC490000B93D00009631000073250000
          50190000FFF0D400FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA0000
          DC920000B97A000096620000734A000050320000FFFFD400FFFFB100FFFF8E00
          FFFF6B00FFFF4800FFFF2500FFFF0000DCDC0000B9B900009696000073730000
          50500000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF0000
          92DC00007AB90000629600004A73000032500000E3FFD400C7FFB100ABFF8E00
          8FFF6B0073FF480057FF250055FF000049DC00003DB900003196000025730000
          19500000D4FFD400B1FFB1008EFF8E006BFF6B0048FF480025FF250000FF0000
          00DC000000B90000009600000073000000500000D4FFE300B1FFC7008EFFAB00
          6BFF8F0048FF730025FF570000FF550000DC490000B93D000096310000732500
          00501900D4FFF000B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FFAA00
          00DC920000B97A000096620000734A0000503200D4FFFF00B1FFFF008EFFFF00
          6BFFFF0048FFFF0025FFFF0000FFFF0000DCDC0000B9B9000096960000737300
          00505000F2F2F200E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAAAA00
          9E9E9E0092929200868686007A7A7A006E6E6E0062626200565656004A4A4A00
          3E3E3E0032323200262626001A1A1A000E0E0E00000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000F7F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F70000009595959595959595959595
          9595959595959595959595959595959595959595959595959595959595959595
          95F9000000949595959595959595959595959595959595959595959595959595
          9595959595959595959595959595959595F900000095EE111111111111111111
          1111111111111111111111111111111111111111111111111111111111111111
          95F9000000951111111111111111111111111111111111111111111111111111
          1111111111111111111111111111111195F90000009511111111111111111111
          1111111111111111111111111111111111111111111111111111111111111111
          95F9000000951111111111111111111111111111111111111111111111111111
          1111111111111111111111111111111195F90000009511111111111111111111
          1111111111111111111111111111111111111111111111111111111111111111
          95F9000000951111111111111111111111F5F8FAF9F7F8111111111111111111
          1111111111111111111111111111111195F90000009511111111111111111111
          11EBF5F2F30AF60AF6F8F9111111111111111111111111111111111111111111
          95F900000095111111111111111111111111F7F4EE07F6F20AF7F9FA11111111
          1111111111111111111111111111111195F90000009511111111111111111111
          11110AF9F0EEF3F5F4F4F4F7FC11111111111111111111111111111111111111
          95F9000000941111111111111111111111110AFAF2ED07F6F6F6F5F41D2B1111
          1111111111111111111111111111111194F90000009411111111111111111111
          1111F91EEF8CF0F2F7F8F8F80AF7FD1111111111111111111111111111111111
          94F900000094111111111111111111111111F6F8F3EEEDF3F6F8F9F8F90A1F11
          1111111111111111111111111111111194F90000009411111111111111111111
          1111F6EAF2EDED0AF8F9FAF9F7FA111111111111111111111111111111111111
          94F9000000941111111111111111111111110AEAF2EDEEF4FAEBF9FBFDFE11FF
          1111111111111111111111111111111194F90000009411111111111111111111
          1111F41DF4F0EDF1F9FBFBFCFEFBF6FEFF111111111111111111111111111111
          94F900000094111111111111111111111111F6F8F6F3EEF1F5FBFBF80AF5F2F3
          FE11111111111111111111111111111194F90000009411111111111111111111
          1111F9EBF5F50AF0F4FBF8F0F107F6FAF8FB1111111111111111111111111111
          94F90000009411111111111111111111111111F61FF5F7F2F7FBF5ED11F3F9F8
          F5F6F81111111111111111111111111194F90000009411111111111111111111
          11111111F62BF8FAFFFDF3ECEEF5F5F4F40AF9FD111111111111111111111111
          94F900000094111111111111111111111111111111F5FA1FFF00F9EFF507EDEF
          F5F9F8F6FFFF1111111111111111111194F90000009411111111111111111111
          111111111111F2F1F113FBFF0AEE11EFF6F70AF60AC7FF111111111111111111
          94F90000009411111111111111111111111111111111111111111111F913EFF2
          F3F1D0B9B9BABAFF111111111111111194F90000009411111111111111111111
          11111111111111111111111111F5F713EDBED0D0B9B9BABAFF11111111111111
          94F900000094111111111111111111111111111111111111111111111111FCF2
          EED4BED0D0B9B9BABAFF11111111111194F90000009411111111111111111111
          111111111111111111111111111111FDBE08C9CCD0D0B9B9BABAFF1111111111
          94F90000009411111111111111111111111111111111111111111111111111FE
          F9BEC8C9BFD0D0B9B9BAC6FF1111111194F90000009411111111111111111111
          11111111111111111111111111111111FFF7BDC8C9BFD0D0B9B9BABAFF111111
          94F800000094EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
          EEFFF7BEC808BED0D0B9B9AEBAFFEEEE94F80000009495959595959595959595
          959595959595959595959595959595959595FFF7BEEDBEBED0D0B9B9BABAFF94
          94F8000000949595959595959595959595959595959595959595959595959595
          959595FFF7BEC9C9C0D0D0B9B9BABAFF94F90000009494949494949494949494
          9494949494949494949494949494949494949494FFF7BEEFC9BFD0D0B9B9BABA
          FFF9000000949494939393939393939393939393939393939393939393939393
          9393939393FFF7BEC8C9BFD0D0B9B9BABAFF0000009494909090909090909190
          90919191909090909090909091919191919191919191FFF7BED408BFD0D0B9B9
          BABAFF0000009494939393949494949494949494939393939393939393939393
          93939494949494FFF7BEBCC9C0D0D0D1B9C6BAF9000000000000000000000000
          000000000000000000000000000000000000000000000000FF0ABEBCBCC0D0D0
          B9B9BAF900000000000000000000000000000000000000000000000000000000
          000000000000000000FFF9BE08BCC0D0D0D1B9F9000000000000000000000000
          0000000000000000000000000000000000000000000000000000FFF8BEBCC9BF
          D0D0B9F900000000000000000000000000000000000000000000000000000000
          0000000000000000000000FF0ABED4BCBED0D0F9000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFF3BEC8
          BCBEF90000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000F9F9F9F9F90000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000
          0003FFFF800000000003FFFF800000000003FFFF800000000003FFFF80000000
          0003FFFF800000000003FFFF800000000003FFFF800000000003FFFF80000000
          0003FFFF800000000003FFFF800000000003FFFF800000000003FFFF80000000
          0003FFFF800000000003FFFF800000000003FFFF800000000003FFFF80000000
          0003FFFF800000000003FFFF800000000003FFFF800000000003FFFF80000000
          0003FFFF800000000003FFFF800000000003FFFF800000000003FFFF80000000
          0003FFFF800000000003FFFF800000000003FFFF800000000003FFFF80000000
          0003FFFF800000000003FFFF800000000003FFFF800000000003FFFF80000000
          0003FFFF800000000003FFFF800000000003FFFF800000000001FFFFC0000000
          0000FFFFFFFFFFFFF000FFFFFFFFFFFFF800FFFFFFFFFFFFFC00FFFFFFFFFFFF
          FE00FFFFFFFFFFFFFF01FFFFFFFFFFFFFF83FFFF}
      end
      object lblVersion: TLabel
        Left = 44
        Top = 26
        Width = 30
        Height = 13
        Caption = 'v2.0.0'
      end
      object lblCopyright: TLabel
        Left = 86
        Top = 188
        Width = 215
        Height = 13
        Alignment = taRightJustify
        Caption = 'Copyright (c)2005-2006 Marc-Andr'#233' Lamothe.'
      end
      object grpSettings: TGroupBox
        Left = 8
        Top = 48
        Width = 289
        Height = 133
        Caption = ' Settings '
        TabOrder = 0
        object lblAlphaValue: TLabel
          Left = 8
          Top = 68
          Width = 110
          Height = 13
          Caption = 'Windows visibility level:'
        end
        object Label2: TLabel
          Left = 251
          Top = 112
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = '100%'
        end
        object Label1: TLabel
          Left = 12
          Top = 112
          Width = 14
          Height = 13
          Caption = '5%'
        end
        object chkAutorun: TCheckBox
          Left = 8
          Top = 44
          Width = 273
          Height = 17
          Caption = 'Launch automatically when Windows starts.'
          TabOrder = 1
        end
        object trbAlphaValue: TTrackBar
          Left = 4
          Top = 84
          Width = 281
          Height = 29
          Ctl3D = True
          Max = 255
          Min = 50
          Orientation = trHorizontal
          ParentCtl3D = False
          PageSize = 20
          Frequency = 5
          Position = 200
          SelEnd = 0
          SelStart = 0
          TabOrder = 0
          TickMarks = tmBottomRight
          TickStyle = tsAuto
        end
        object chkEnabled: TCheckBox
          Left = 8
          Top = 20
          Width = 273
          Height = 17
          Caption = 'Enable windows alpha transparency.'
          TabOrder = 2
        end
      end
    end
    object tbsExclusions: TTabSheet
      Caption = 'Exclusion list'
      ImageIndex = 1
      object stgExclusions: TStringGrid
        Left = 8
        Top = 40
        Width = 289
        Height = 137
        ColCount = 1
        DefaultColWidth = 265
        DefaultRowHeight = 18
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect, goThumbTracking]
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object btnAddExclusion: TButton
        Left = 8
        Top = 8
        Width = 73
        Height = 25
        Caption = 'Add'
        TabOrder = 0
        OnClick = btnAddExclusionClick
      end
      object btnRemoveExclusion: TButton
        Left = 88
        Top = 8
        Width = 73
        Height = 25
        Caption = 'Remove'
        TabOrder = 1
        OnClick = btnRemoveExclusionClick
      end
      object btnSelectWindow: TButton
        Left = 168
        Top = 8
        Width = 129
        Height = 25
        Caption = 'Select a window...'
        TabOrder = 2
        OnClick = btnSelectWindowClick
      end
      object chkTransTaskbar: TCheckBox
        Left = 8
        Top = 184
        Width = 289
        Height = 17
        Caption = 'Apply transparency to the task bar (Start menu).'
        TabOrder = 4
      end
    end
  end
  object PopMenu: TPopupMenu
    object PopMenu_Config: TMenuItem
      Caption = '&Configure...'
      Default = True
      OnClick = PopMenu_ConfigClick
    end
    object PopMenu_N1: TMenuItem
      Caption = '-'
    end
    object PopMenu_Disable: TMenuItem
      Caption = '&Disable'
      OnClick = PopMenu_DisableClick
    end
    object PopMenu_Enable: TMenuItem
      Caption = '&Enable'
      Enabled = False
      OnClick = PopMenu_EnableClick
    end
    object PopMenu_N2: TMenuItem
      Caption = '-'
    end
    object PopMenu_Exit: TMenuItem
      Caption = 'E&xit'
      OnClick = PopMenu_ExitClick
    end
  end
end