# sphere
mkdir sphere
cd sphere
git clone git@github.com:heysphere/api.git api
cd api
npm i
# make sure this passes
make dependencycheck
subl .
# in separate window
make devenv


# myweb
cd
mkdir myweb
git clone git@github.com:DiscreteConcrete/DiscreteConcrete.github.io.git myweb

# artstokk
# setup inspired by https://rationalappdev.com/charts-in-react-native-part-1/
mkdir artstokk
cd artstokk
git clone git@github.com:DiscreteConcrete/artstokk-app.git app
cd app
yarn
open ios/artstokk.xcodeproj
# run via spotlight React Native Debugger
