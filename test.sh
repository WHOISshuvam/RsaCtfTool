#!/bin/bash

cd "$(dirname "$0")"
clear
echo -e "\033[1mTest factordb expression parsing\033[0m"
./RsaCtfTool.py --publickey "examples/factordb_parse.pub" --private --attack factordb
echo -e "\033[1m\nTest noveltyprimes\033[0m"
./RsaCtfTool.py --publickey examples/elite_primes.pub --private --attack noveltyprimes
echo -e "\033[1m\nTest small_q\033[0m"
./RsaCtfTool.py --publickey examples/small_q.pub --private --uncipherfile examples/small_q.cipher --attack smallq
echo -e "\033[1m\nTest Mersenne Primes\033[0m"
./RsaCtfTool.py --private -e 0x10001 -n 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 --attack mersenne_primes
echo -e "\033[1m\nTest wiener\033[0m"
./RsaCtfTool.py --publickey examples/wiener.pub --private --uncipherfile examples/wiener.cipher --attack wiener
echo -e "\033[1m\nTest Boneh Durfee\033[0m"
./RsaCtfTool.py --publickey examples/wiener.pub --private --uncipherfile examples/wiener.cipher --attack boneh_durfee
echo -e "\033[1m\nTest commonfactors\033[0m"
./RsaCtfTool.py --publickey "examples/commonfactor?.pub" --private --attack commonfactors
echo -e "\033[1m\nTest fermat\033[0m"
./RsaCtfTool.py --publickey examples/close_primes.pub --private --uncipherfile examples/close_primes.cipher --attack fermat
echo -e "\033[1m\nTest fermat2\033[0m"
./RsaCtfTool.py --publickey examples/fermat.pub --private --attack fermat
echo -e "\033[1m\nTest pastctfprimes\033[0m"
./RsaCtfTool.py --publickey examples/pastctfprimes.pub --private --attack pastctfprimes
echo -e "\033[1m\nTest SIQS\033[0m"
./RsaCtfTool.py --publickey examples/siqs.pub --private --attack siqs
echo -e "\033[1m\nTest ECM\033[0m"
./RsaCtfTool.py --publickey examples/ecm_method.pub --private --ecmdigits 25 --attack ecm --timeout 60
echo -e "\033[1m\nTest ECM2\033[0m"
./RsaCtfTool.py -n 14641034851154010900546719241402474912998133209474218975103977449764205791710698412984067810848509509669017831054155506105922179074286929418416328797379636196613023210067141695123691351917498467761961980966631958692894027223505926821780581042313171803091956255639968110368314924456998367348008686435826036480738828760312467761150839006456972383 -e 65537 --uncipher 7102577393434866594929140550804968099111271800384955683330956013020579564684516163830573468073604865935034522944441894535695787080676107364035121171758895218132464499398807752144702697548021940878072503062685829101838944413876346837812265739970980202827485238414586892442822429233004808821082551675699702413952211939387589361654209039260795229 --attack ecm2 --timeout 60
echo -e "\033[1m\nTest createpub\033[0m"
./RsaCtfTool.py --createpub -n 8616460799 -e 65537
echo -e "\033[1m\nCreatepub into Crack feedback\033[0m"
./RsaCtfTool.py --createpub -n 163325259729739139586456854939342071588766536976661696628405612100543978684304953042431845499808366612030757037530278155957389217094639917994417350499882225626580260012564702898468467277918937337494297292631474713546289580689715170963879872522418640251986734692138838546500522994170062961577034037699354013013 -e 65537 > /tmp/crackme.txt
./RsaCtfTool.py --publickey /tmp/crackme.txt --private
rm -f /tmp/crackme.txt
echo -e "\033[1m\nTest hastads\033[0m"
./RsaCtfTool.py --publickey "examples/hastads01.pub,examples/hastads02.pub,examples/hastads03.pub" --uncipher 261345950255088824199206969589297492768083568554363001807292202086148198540785875067889853750126065910869378059825972054500409296763768604135988881188967875126819737816598484392562403375391722914907856816865871091726511596620751615512183772327351299941365151995536802718357319233050365556244882929796558270337,147535246350781145803699087910221608128508531245679654307942476916759248311896958780799558399204686458919290159543753966699893006016413718139713809296129796521671806205375133127498854375392596658549807278970596547851946732056260825231169253750741639904613590541946015782167836188510987545893121474698400398826,633230627388596886579908367739501184580838393691617645602928172655297372145912724695988151441728614868603479196153916968285656992175356066846340327304330216410957123875304589208458268694616526607064173015876523386638026821701609498528415875970074497028482884675279736968611005756588082906398954547838170886958 --attack hastads
echo -e "\033[1m\nTest ROCA attack\033[0m"
python3 ./RsaCtfTool.py --attack roca -n 5590772118685579117817112787486780348504267507289026685912623973671010394384988015497235515969796783937905129055952167826830196634107346761087047942625347 -e 65537 --private --timeout 90
echo -e "\033[1m\nTest informations output --dumpkey --ext\033[0m"
./RsaCtfTool.py --publickey "examples/factordb_parse.pub" --private --attack factordb --dumpkey --ext
echo -e "\033[1m\nTest unciphering multiple files\033[0m"
./RsaCtfTool.py --publickey examples/primefac.pub --uncipherfile examples/cipher1,examples/cipher2,examples/cipher3
echo -e "\033[1m\nTest unciphering single file with multiple keys\033[0m"
./RsaCtfTool.py --publickey examples/boneh_durfee.pub,examples/primefac.pub  --uncipherfile examples/cipher1
echo -e "\033[1m\nTest cube root\033[0m"
./RsaCtfTool.py --uncipher 2205316413931134031074603746928247799030155221252519872650101242908540609117693035883827878696406295617513907962419726541451312273821810017858485722109359971259158071688912076249144203043097720816270550387459717116098817458584146690177125 -e 3 -n 29331922499794985782735976045591164936683059380558950386560160105740343201513369939006307531165922708949619162698623675349030430859547825708994708321803705309459438099340427770580064400911431856656901982789948285309956111848686906152664473350940486507451771223435835260168971210087470894448460745593956840586530527915802541450092946574694809584880896601317519794442862977471129319781313161842056501715040555964011899589002863730868679527184420789010551475067862907739054966183120621407246398518098981106431219207697870293412176440482900183550467375190239898455201170831410460483829448603477361305838743852756938687673 --attack cube_root
echo -e "\033[1m\nTest Ekoparty ctf\033[0m"
./RsaCtfTool.py --private -e 65537 -n 79832181757332818552764610761349592984614744432279135328398999801627880283610900361281249973175805069916210179560506497075132524902086881120372213626641879468491936860976686933630869673826972619938321951599146744807653301076026577949579618331502776303983485566046485431039541708467141408260220098592761245010678592347501894176269580510459729633673468068467144199744563731826362102608811033400887813754780282628099443490170016087838606998017490456601315802448567772411623826281747245660954245413781519794295336197555688543537992197142258053220453757666537840276416475602759374950715283890232230741542737319569819793988431443
echo -e "\033[1m\nTest multiprime from NahamCon ctf\033[0m" 
python3 ./RsaCtfTool.py -n 7735208939848985079680614633581782274371148157293352904905313315409418467322726702848189532721490121708517697848255948254656192793679424796954743649810878292688507385952920229483776389922650388739975072587660866986603080986980359219525111589659191172937047869008331982383695605801970189336227832715706317 -e 65537 --uncipher 5300731709583714451062905238531972160518525080858095184581839366680022995297863013911612079520115435945472004626222058696229239285358638047675780769773922795279074074633888720787195549544835291528116093909456225670152733191556650639553906195856979794273349598903501654956482056938935258794217285615471681 --attack factordb
echo -e "\033[1m\nTest cm factor\033[0m" 
python3 ./RsaCtfTool.py --publickey examples/cm_factor.pub --attack cm_factor --private