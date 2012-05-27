﻿ALTER TABLE [PayTypeDepartment] DROP CONSTRAINT [FK_PayTypeDepartment_PayType_PayType_PayTypeID]
ALTER TABLE [PayTypeDepartment] DROP CONSTRAINT [FK_PayTypeDepartment_Department_Department_DepartmentID]
DROP INDEX [IX_PayType_PayTypeID] ON [PayTypeDepartment]
DROP INDEX [IX_Department_DepartmentID] ON [PayTypeDepartment]
EXECUTE sp_rename @objname = N'Timecard.Employee_EmployeeID', @newname = N'EmployeeID', @objtype = N'COLUMN'
CREATE TABLE [DepartmentPayType] (
    [Department_DepartmentID] [int] NOT NULL,
    [PayType_PayTypeID] [int] NOT NULL,
    CONSTRAINT [PK_DepartmentPayType] PRIMARY KEY ([Department_DepartmentID], [PayType_PayTypeID])
)
CREATE INDEX [IX_Department_DepartmentID] ON [DepartmentPayType]([Department_DepartmentID])
CREATE INDEX [IX_PayType_PayTypeID] ON [DepartmentPayType]([PayType_PayTypeID])
ALTER TABLE [Timecard] ALTER COLUMN [EmployeeID] [nvarchar](128)
DROP TABLE [PayTypeDepartment]
ALTER TABLE [DepartmentPayType] ADD CONSTRAINT [FK_DepartmentPayType_Department_Department_DepartmentID] FOREIGN KEY ([Department_DepartmentID]) REFERENCES [Department] ([DepartmentID]) ON DELETE CASCADE
ALTER TABLE [DepartmentPayType] ADD CONSTRAINT [FK_DepartmentPayType_PayType_PayType_PayTypeID] FOREIGN KEY ([PayType_PayTypeID]) REFERENCES [PayType] ([PayTypeID]) ON DELETE CASCADE
INSERT INTO [__MigrationHistory] ([MigrationId], [CreatedOn], [Model], [ProductVersion]) VALUES ('201205250444595_modLineAndTimecard', '2012-05-25T04:46:39.980Z', 0x1F8B0800000000000400ED1D5D8FE4B6EDBD40FFC3609EDA02D9D9BB024112EC26B8ECDEB587E43E70734D1F17BEB176CF88C79E7A3CD7DDDFD687FEA4FE85FA53962552A264F96382BCED8E248AA2288A2269F27FFFF9EFD50F8FFB78F58565C7284DAED7CF2E2ED72B96ECD2304A1EAED7A7FCFEAB6FD63F7CFFC73F5CBD0CF78FAB5FDA7ECFCB7EC5C8E478BDFE9CE787EF369BE3EE33DB07C78B7DB4CBD2637A9F5FECD2FD2608D3CDF3CBCB6F36CF2E37AC00B12E60AD56571F4E491EED59F54FF1EF4D9AECD8213F05F19B3464F1B1F9BD68D95650576F833D3B1E821DBB5E7F2CC6DDC4E9EED78BBAEF7AF5228E82028F2D8BEF2D91BAFCB6446ACDA72B267C5920963F7D7C3AB06AD2EBF5CBFD214E9F18137B15FD7E624FBD1F8A9FDE67E98165F9D307762F8D7D7DBB5E6DFAE33732003E1C185BA2532C30CF8A5D59AF5E458F2CFC99250FF9E7EBF57D101FD97AF526786C7F79F6FC9BF5EA1F49546C623128CF4E45F3DB531C079F62C6FB6FB473BF8AB2635EFE693975F1A766EAFA7FFDCC3F07334DFC9165FB28097216B653FF98A6310B126BE2BD8F92C9B1BF658720CBF72CC93B76799DE47F7D6E8DFD9B20091E5866CD750E6B781B7C891E82BC1028300EEBD5071657EDC7CFD1A13EE017EDB1B8E39D5E65E9FE431A0B47A66DBBDBA6A76C57F2528A74F818640F2CA763F6FE941412E5A8C78C7702306BDA70CCDA0EB698FD12B17FB3F00D3B1E8B85191094FB0278F6BBE0E84AFD6CB12E85F92EC84203C242370057DE8AA3D975B1C59046512D2DCD54D4D2EF6AD3DD49DA9BAA621D976BAA1AE87247F1817A8973F8FABB6D9E66EC6F2C61592962DF0779CEB2428F781DB26A15CDBDFDDDE16BDAD5FDEDE6F27979756F822449F36A5B4C82ED755232418BEA6D8146FDBFA57C7C77CA4D70A615D823E909944554DB5FCE69BD06F4B8FD1C25C859AB26BB6BDABB5326FCAC9C2FB16DD0C92A41B81CAC729CCBB96AC79DC1B1228A0083F2D588E7A170B68738CAB77971B2069FF30AD4CB241C0CE87DF0E4F7883400E14352B701C7446CE087811F945E6B7B8CDC2EA1063B976BA8A394F5454425F222CECC6D10C54F95C23C84D9FFC9D8AF1EC0DCB2E32E8B0E35DEB3A9FC6FD9634E61EC5E3F95BD8566F53600FAD86A839AEB8976F230A4F04B4A874EA745C04875ED77CD443DD480664534407D0609880EA08B8CE8EB4DB662C246EB5A84A498C70693EE8269C4812AC5DFB32C4AC32D635E2EDE1A5AB1C32CFB12C4BE2EE09B747F089227D389E3DDC003D7B42A0201E8622B15DA17815126081D411C79BB0ECBAE934F638A287654738ADAAAC3D0D5A4F2F7348EC2E00946B069BCEB89E00E43A05911AD501F48B41294416FE25F4746F98A7012FFEDA97090FDCD5017C12F0CFD5DEA5BED57C3A42EFBD50C75D92F61E819ECD7A42AB4F296C8871BB53EB0030B4A01E6E78234A9A50EB253964B3AF9EAC4E78D09B6B667FBF5F581DD9BF9FC78061D5D3D1D0A831E9005D73564B3328A92B7A6B50EB9EC8A6859B2A533DD2AB5082934A721B855B5ED2591C353BBDD17F5ADDD6F518486D4EC435EB8F0E480A34F3EB28BE0C81FD3F069F20B71E90EEC660B21FFB5D4A4F0AFDCEEF761D842075F854A238A9CFE3D68E7CC74B6248B8E2927A7E639599367D43E6BEF4FF26E6EF3B1CE94C0F713B224288DB013B1D7C386AF5F1C8FE92EAA50920E211700FD25BE4CC295299AA5A6B218805010F614E7D1218E760512D7EBBF28A4D3C0E5760933DCCB8B8B67F2C28525EA570ED9F03124B506FD0E4FEE0AA02F5FE7063043F642805A6F312128E93046D49EAD65C1F82EB96531CBD9EAC52EAFC2366F82E32E08D57355306F484307A054E51C376E40219C5956CAC420BE298E679E055192AB923C4A76D1218875A49006D9B912CBC5F259E496E231C9925270EB963E787A3E8BB407260A59301A6085C6B6576792EEF65870DA581C358D2D5B80CDEDE41E4F1A68E426A009A83714228C74F4B45676A75BC0E914EAE843390D3A9F9DD579D4D1C30722D39ECC561B21ECBEA29B2C8329658548BCA3AA58C4D1F95122CC5CDC2811E24C781132C362BBAEB5C976DBDE7A0B2C2E09ADA7CCE106723C8CAD7F8CC2F68AB3CCE345A90662D86ABB360AA9105389EA7F5080A5E1A08FA58A02F19C1329A22A11487A201C586DA784AA8B1E38F504A245F916C2F818D55C71F4C7A81EF4C4D714B634CAEE699D4974DEC148301C85297948FA5CC5B8DFD8B72BFE380AF9EA4598A1EF4EF426B025D7078628E607E9F0E33EB5692437E279994678C3D4A09C01DC7B68750CE1D50F4760CA43D87D82653C1DC0F758FE8E9EFA251781AB7D4B74658573C87485126721D565F717B6E1A82F4C91B1368A36E6411BDBF4ADFAD64C186A2D51C8CA0D6708F7D0D9DB925C4408FD061FF3EE26DCDA9E1F583DDF93F66D033BA22475754ADB3FEAFB9A488746A9427E02F970036054F0808477895BBB218B3179318265821E5125CD281BD8A3FCE9453D68CB723550A0736B2AE74F396B7D20DCDBAA806838C630BE89EE5146D79AA269721EEFACCEDE5A510C207AD1890A14D1D06300543B38221019EEFC30C0E862D11510DCE66600D10ABEF64DA20092DE2C0670C237F90AA44E0F23E2846343633374AF3B812981118E8FCAF75D708ED00D4B40219F6982079FAFA177D414E940F0D95320F56445D1954008F0733B9516468F7EFF36D1F8F4857574475743109D179F006B00491AB1841303789A83A8F7DFE6AE04E83FA805280D9E83D70D7DD1A42EDEE471C6CCDDB2CF5958404FFE6A28A1F1320BD00421EC9324C2A1D3120551FCB185A8DAFF30C2A82AFF488203FA6E4B4B18502F469D23926A3C8C28B24E2B1EC116F7C10401BF75502962F4C591BD71C22A3AA54143109DFF8D46DF816CC2A59D9E4F40071DD94537905364A7DC48578C98E204B860306F9DD15F67E66CA39F6D849B454D98A5D1B6CC72027525B96B5B934808342D97861A3A97889553C49D36880F4400283F3806534AFEF0432590CE3F42F19008D80BEF1B0D3910C7C698A745404CC32188BD9E6AB177E70BD5404F21AA0341940F29546A688DCD247333C0CE5A326006E691D42DE09B0D9C0A141D14373FBB526232D51348C6A77BBD5BC84E8F5293222F7D6912FD6F1E107D02374E13CDD3F29D4878BAA256E541F76BFB0906B77DF2B6AB4D9D46B8F9E16A83E41BBE7A131C0E51F220E41F6E7E596DEBE4C3375F6DED530CEF6B189B5D8FC0B2A596CF94A759C105526BF9800D599597F736C8834F41F931CD4DB857BA512DBDED74B2C157DDB6D6A4D68E28FF96ACCA4D2AE6CE36AC5AC69BD1AF8AB5952A75B54C069C2375E8AACC021DC441A6F9DEF5268D4FFBC4ECE2C4A109298F4560C2CF74585D12631154F72B1D929895588425FE4E8756652616C1543FD0C7F763564540FA68561CA2F0B1A6084EF8598575B591784971AA283CAB78BCFA8780744470196971408014AD1510D3E940C6A11BDD06FFF5361B8B08C4E1B439534530ED6F74283C65AA0886FF3827FBF915213D579F4279CC07381B43634F240B7656F3A256304CDC0C0F43A569930CB5274BC1C4AAC6CDF17024C488AC9E44D6446AE1D0C484A52234F1774B6855CE520556F5AB05B5BA0FD87AF4C2BF6B9B4F2EE386411BC10C7BAF28A2191BE993B6A848E499447BE290FF4A872464131541093FDB086AE18BF4BE9C161A16C3417A9BBB051361A92D497CA41B3CDD8DA8AAADD6CA2FCF1ED913D8FC572B2124A683940E8BD8E400B34B0A09C2ED9A17C3A69D0773109322EE590287A22331620B59F74422A379FC74B0E88C39D3F67067DBA0DD01D3ED9176071D895154C8B1279215CDDAA783E52AF1F17B2D67F29D965B89219ED24E04C27F5C0CD7483E9241BCA3496147E220C3F8691E514286AB9E4500CB9965E2A2D6F924F312EC949A9113740E1B0B268093E591F61F1F3ACD63C8F36BBCCB4907DEF00BDA7A8D2FC2FEF8BB1F7CFABEFB3CA4759238114CFDCB6FD788E8E3B90A674723EDB666AC6FCBD654EA8294864C35F1F0A6E939A1EFAF82DD2E9D0F9BE05CE93A537D28A5EF0D91B5B2A35A258F95A86EA1E93F3313D071C014FD02C4DBA5A2C5F0264DC2A8FAC4E7F5B14C57C753DBD9D14176645AF30E18A26DB670F5FB138D59C0B66802B0893B83D8C14480DA3C5A565CA4893D1F86AE2B8A243622D16230274111DE242B57D79D6ECC02F6060FE0266E8DDECE70A7B1375872111EB84EC4D4D560379C958CC418CC4660A4B3D9D4D1EF8F5835ACF849131D4DDC26BD69E44E6322B164284DF0B5478EBA73652E9FA2A58B93A6C996AE3F2E5CE8D79526367C098426E3ECE58A1D74BD0EE60934DE99A2FBCA63AC6C583AED128E8FF6A4648EA20FC301D823AAC5FEAC01C3AF3302650733AA12606C36BEE06F33C4C6026C301242BCBC97191233BD60AE99E05906446413D846E83DE0518F066F7BD9923BD7ADA1203ABEF4F2C03D263AF8BB1AED2E45E3756865103AA32BD0F1F23BDB0B4B097197BB706366F30BFF9F87B837E1E5BDB8F78A4E65147B459F6313EA2EC79BD75DD6AB820C5FA2B08C35DF3E1D73B6BF283B5C6CFF15DFC451F940E31D0A691BDDB363FE31FD9525D7EB321C7EBD7A1147C1B1FE00C12A929E17C6381EC31888A32FCF89C41E7EAB78B9D4E54ABE04D9EE7390A9E5962C6B6C0961E87DC87FDA078F7FB62EF01A78042686A2D7E03E45B97DB1D628F1820D54E1374AECF151AA080DC20AD23BE81C429A41BD9BC0C50F28C306C4A05B54E371AEC4232DC5586FC772A3DB70F67A8AB0009ABB5450E4E1EC389C29D9773C4603AA23991124F3981A194E6331381EDCCC61EDB811190C62624B106A21421728624CF9406EEF42CA0702122C50DE79092E31449358B8AFC528B3C015F966AA2EC2DB9D1F84D06E772040F1B1413725E2F1F27D9761FE041A7BE8ACBC660E4165BC6F26F1A72FF2E06D0FC0A4D0EDE102440ED8766766C047E69BF11652FE7C49FC766EA5C8C711E89EE5A85816DCF9704965C13DDECD675D6DDBE93D6978973956DA767D6780D6A8210F85332CE63DCA391EF1E125D7D8261EEB73AB683DCAB68895A87D5872CEC62E34DF415F5401E7B3B8B3C162CA232A52C31E41946028DDD3491B2B4356CBEE60F5CC7A2711ACBC2B3E86D825DBF7A729E008356DE8C249E90F58476AA15613E393DF82F41E2A6FFBAC3B513BBC08F03CD7AA99A3344DB556CABCB4A09469CBB29A4BB488A9FF850D9DBC12AB159B7AAFBD3A6DB1552B765E406D55EB823F1EEAFBCCC10FF8478716AF84F1388114BAB4D4B2CFF34A97A6488B80C234359DA7952B5842B6450A157D32EC91149869F9600EB585CE03B3EB290EF5C4E62F20367DB5B0E9CB832DB21618C03F788D1AB5B60CA5F6F8487C53D7F812A61FB3B6379AFACD2230C08A6390B48996D34D256E28F5E1672B093F29A3D81DF4C99864D64AEF9615A9E72C423D25AF68D2F0D8F8B5C6E198D9AB4A1BEBC6B95D46264DB61EA558E21068677BBD88EBA4CC4ACEB830ED43190E95E9B6B397AB402EA769C518D64F6E4FAC81A762B488FEB1620DCB67362983C2940F5F5DDDA391DEBF525554D54AD7B6FC66DEC3A63C82F8C4F31BF24DF58F4662122BF5E68C59C34AAD999D19B4E59FC615170E65E5CF890FACCCFE4B71F2196A3FFDCE101331C4726E0B6AA620B55C6A6F3BF96F933C63D5E81D0097D175573C51B545F4B5158B195341E9E6D6E76C9A89D5A0AFD617E8095C06C3CDE52174633B8B9C5013BB9F75D9AF16C87C6AC01C8CCEB8469CB998CF98EAEC4C99CF20F9E677402D83EDA6B71DBA31DC3CD6C397FD5C28DC6625D7C994F7B8C98E2369A36DF55150E3AF739F5CAFC34F69C108752C6AD7AAE8FEFD191A7F9802BEF91D82DD341900D7FE0B056EFD3304B66E31A1DBB2B48A304F1B0CA1DC361AC08B37883283D8084D22B61BE6E1A66065922E6B2D30036F3480E73ABF029EB740E079A301BC645B542691DAA1A9A42E86093B63953257D7044DD3B5D296842F46BB0CDA29C318B76B434F1B8979016517DB7F132B03DDC827073FA2401FFD39C28EADA1C47680D65CD747D9236616BE545CAC82236B5F1E61B4430D6D30261C58B039761C55AC05C4713E7027D9820ACA4385CE675D281091ABDF5B738DF4613BDBD31284A2BFC397AA848DEA4EAD7999EEA776BC258E57EF1E2E703FD7327BE17BD012F1F83EF881252209DF04BD71A2C6D995F2F5B47F9A656171682E749F6441525814B0265DE0540F455933EBD7EA9A65B7A052223833A2513E5E58B217D5631E3BECAAE0AF03ED5581C47540B12B02C2C8CB63D81533E4BA9073AD6B6E0D5D5C86A7CB037C110139DF3D12A08B21D0AD5D57B86FF8B2AD4EFF00854FA3D16BDDE87E7797A2260ED95112334FC1C6232D54E3D004564C2F94023940850520560D93174985E05590695C6E4462C069A5BDA9FCD39344E30832BC7EF44553BC9104B57120955FC62109CE2554678617D5663C622889C479DBD5A6B617353F14FF2A09C3AF361F4E499979A8FEEF961DA3870E44990E3D61BB9EB19EF7799DDCA7ADFB40C2A8EDA2E407CA8330C88317591EDD07BBBC68DE15E2324A1ED6AB5F82F85409E34F2C7C9DBC3BE587535E2C99ED3FC53D5954FA1E74F35F6D149CAFEA2C2C471F4B28D08CCA644DEF921F4F511C72BC5F01C92C1010A553A3C95C53EE655E66B07978E290DEA6B25E8F016AC8C77D311F59716915C08EEF926DF085E1B89969D8A7D8D56D143C64C15EA460FD4B83C936286616A62826104774F315FF16EC1AEE1FBFFF3F69408CDEB0E60000, '4.3.1')
